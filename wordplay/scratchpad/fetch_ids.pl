#!/usr/bin/env perl
use strict;
use warnings;

sub norm_text {
  my ($s) = @_;
  $s = lc $s;
  $s =~ s/[\x{2013}\x{2014}\x{2010}]/-/g;   # dashes
  $s =~ tr/\x{2018}\x{2019}/\x27\x27/;      # single quotes
  $s =~ tr/\x{201C}\x{201D}/\x22\x22/;      # double quotes
  $s =~ s/[^a-z0-9]+/ /g;
  $s =~ s/\s+/ /g;
  $s =~ s/^\s+|\s+$//g;
  return $s;
}

my %STOP = map { $_ => 1 } qw(
  a an the and or of for to in on with without via by from into at as is are be have has
  using toward towards based small large model models language languages agent agents
  multi multiagent multi-agent game games framework benchmark evaluation evaluating
  study case approach method methods decision decisions making strategic strategy
  social negotiation negotiations real time deep reinforcement learning human humans ai llm llms
);

sub tokenize {
  my ($s) = @_;
  $s = norm_text($s);
  my @t = grep { $_ ne '' && !$STOP{$_} } split /\s+/, $s;
  return \@t;
}

sub overlap_score {
  my ($a_ref, $b_ref) = @_;
  my %a = map { $_=>1 } @$a_ref; my %b = map { $_=>1 } @$b_ref;
  my $inter = 0; for my $w (keys %a) { $inter++ if $b{$w}; }
  my $union = scalar(keys(%a)) + scalar(keys(%b)) - $inter;
  my $j = $union ? $inter/$union : 0;
  my $ca = @$a_ref ? $inter / scalar(@$a_ref) : 0;
  my $cb = @$b_ref ? $inter / scalar(@$b_ref) : 0;
  my $score = 0.5*$j + 0.3*$ca + 0.2*$cb;
  return ($score, $inter, $j, $ca, $cb);
}

sub urlenc {
  my ($s) = @_;
  $s =~ s/([^A-Za-z0-9_.~-])/sprintf("%%%02X", ord($1))/seg;
  return $s;
}

sub missing_titles_from_table {
  my $path = shift // 'content/ai_in_wargames_table.typ';
  my @m; open my $T, '<', $path or die $!;
  while (my $line = <$T>) {
    $line =~ s/^\s+|\s+$//g;
    next unless $line =~ /^\[(.*)\],\s*$/;
    my $c = $1;
    next if $c =~ /\*Q\*/;
    next if $c =~ /^I{1,3}$|^IV$/;
    if ($c =~ /^\"(.*)\"\s+[a-z0-9_\-]+$/) { next; }
    elsif ($c =~ /^\"(.*)\"$/) { push @m, $1; }
  }
  close $T; return @m;
}

sub arxiv_lookup {
  my ($title) = @_;
  my $param = urlenc('ti:"' . $title . '"');
  my $url = "http://export.arxiv.org/api/query?search_query=$param&max_results=5";
  my $xml = qx(curl -sL "$url");
  return undef unless $xml && $xml =~ /<entry>/;
  my $best; my $bestscore = 0; my $mtoks = tokenize($title);
  while ($xml =~ m|<entry>(.*?)</entry>|sg) {
    my $e = $1;
    my ($et) = $e =~ m|<title>\s*(.*?)\s*</title>|s; $et //= '';
    $et =~ s/&amp;/&/g; $et =~ s/&lt;/</g; $et =~ s/&gt;/>/g; $et =~ s/\s+/ /g; $et =~ s/^\s+|\s+$//g;
    my ($id) = $e =~ m|<id>\s*http://arxiv\.org/abs/([^<\s]+)|s; next unless $id;
    my $btoks = tokenize($et);
    my ($score,$inter,$j,$ca,$cb) = overlap_score($mtoks,$btoks);
    if ($score > $bestscore) { $bestscore=$score; $best={ id=>$id, title=>$et, score=>$score, inter=>$inter, j=>$j, ca=>$ca, cb=>$cb } }
  }
  # accept only if reasonably similar
  return $best if $best && ($best->{ca} >= 0.6 || $best->{j} >= 0.5 || norm_text($best->{title}) eq norm_text($title));
  return undef;
}

sub crossref_lookup {
  my ($title) = @_;
  my $param = urlenc($title);
  my $url = "https://api.crossref.org/works?query.title=$param&rows=5";
  my $json = qx(curl -sL "$url");
  return undef unless $json && $json =~ /"DOI"/;
  my $best; my $bestscore=0; my $mtoks = tokenize($title);
  # crude parse: iterate over items; look for DOI and title
  while ($json =~ /\{([^{}]*?"DOI"\s*:\s*"([^"]+)".*?"title"\s*:\s*\[\s*"([^"]+)"\s*\])/sg) {
    my ($block,$doi,$t) = ($1,$2,$3);
    my $btoks = tokenize($t);
    my ($score,$inter,$j,$ca,$cb) = overlap_score($mtoks,$btoks);
    if ($score > $bestscore) { $bestscore=$score; $best={ doi=>$doi, title=>$t, score=>$score, inter=>$inter, j=>$j, ca=>$ca, cb=>$cb } }
  }
  return $best if $best && ($best->{ca} >= 0.6 || $best->{j} >= 0.5);
  return undef;
}

my $path = $ARGV[0] // 'content/ai_in_wargames_table.typ';
my @missing = missing_titles_from_table($path);
open my $OUT, '>', 'scratchpad/ids.csv' or die $!;
print $OUT "title,source,id,score,details\n";
for my $t (@missing) {
  my $a = arxiv_lookup($t);
  if ($a) {
    print $OUT join(',', map { my $x=$_; $x =~ s/,/ /g; $x } ($t,'arxiv',$a->{id}, sprintf('%.2f',$a->{score}), sprintf('j:%.2f ca:%.2f cb:%.2f',$a->{j},$a->{ca},$a->{cb}))), "\n";
    next;
  }
  my $c = crossref_lookup($t);
  if ($c) {
    print $OUT join(',', map { my $x=$_; $x =~ s/,/ /g; $x } ($t,'doi',$c->{doi}, sprintf('%.2f',$c->{score}), sprintf('j:%.2f ca:%.2f cb:%.2f',$c->{j},$c->{ca},$c->{cb}))), "\n";
    next;
  }
  print $OUT join(',', ($t,'none','', '', 'not found')), "\n";
}
close $OUT;

print "Wrote scratchpad/ids.csv\n";
