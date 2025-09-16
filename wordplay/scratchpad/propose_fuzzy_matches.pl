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
  using toward towards towardly towardness towardfull towarded towarder based small large
  model models language languages agent agents multi multiagent multi agent game games
  framework benchmark evaluation evaluating study case approach method methods
  decision decisions making strategic strategy social negotiation negotiations
  real time deep reinforcement learning human humans ai llm llms large
);

sub tokenize {
  my ($s) = @_;
  $s = norm_text($s);
  my @t = grep { $_ ne '' && !$STOP{$_} } split /\s+/, $s;
  return \@t;
}

# Parse zotero.bib entries: key, title, year
open my $B, '<', 'zotero.bib' or die $!;
my @bib;
my ($key, $buf, $depth) = (undef, '', 0);
while (my $line = <$B>) {
  if (!defined $key) {
    if ($line =~ /@\w+\s*\{\s*([^,\s]+)\s*,/) {
      $key = $1; $buf = $line; $depth = () = $line =~ /\{/g; $depth -= () = $line =~ /\}/g; next;
    }
  } else {
    $buf .= $line; $depth += () = $line =~ /\{/g; $depth -= () = $line =~ /\}/g;
    if ($depth <= 0) {
      my $entry = $buf; my ($title,$year);
      if ($entry =~ /\btitle\s*=\s*([\{\"])\s*/i) {
        my $q = $1; my $rest = $';
        if ($q eq '{') {
          my $lvl = 1; my $t=''; for my $ch (split //, $rest) {
            if ($ch eq '{') { $lvl++; $t.=$ch; }
            elsif ($ch eq '}') { $lvl--; last if $lvl==0; $t.=$ch; }
            else { $t.=$ch; }
          }
          $title = $t;
        } else { ($title) = $rest =~ /(.*?)\"/s; }
      }
      ($year) = $entry =~ /\bdate\s*=\s*\{(\d{4})/i; $year //= '';
      push @bib, { key=>$key, title=>($title//' '), year=>$year } if defined $title;
      $key=undef; $buf=''; $depth=0;
    }
  }
}
close $B;

# Extract titles from table and detect which are missing keys
open my $T, '<', 'content/table.typ' or die $!;
my @missing; my @present;
while (my $line = <$T>) {
  $line =~ s/^\s+|\s+$//g;
  next unless $line =~ /^\[(.*)\],\s*$/;
  my $c = $1;
  next if $c =~ /\*Q\*/;
  next if $c =~ /^I{1,3}$|^IV$/;
  # Expect ["Title" key] or ["Title"]
  if ($c =~ /^\"(.*)\"\s+([a-z0-9_\-]+)$/) {
    push @present, { title=>$1, key=>$2 };
  } elsif ($c =~ /^\"(.*)\"$/) {
    push @missing, $1;
  }
}
close $T;

sub score_pair {
  my ($a_ref, $b_ref) = @_;
  my %a = map { $_=>1 } @$a_ref; my %b = map { $_=>1 } @$b_ref;
  my $inter = 0; for my $w (keys %a) { $inter++ if $b{$w}; }
  my $union = scalar(keys(%a)) + scalar(keys(%b)) - $inter;
  my $j = $union ? $inter/$union : 0;
  my $cov_a = @$a_ref ? $inter / scalar(@$a_ref) : 0;
  my $cov_b = @$b_ref ? $inter / scalar(@$b_ref) : 0;
  my $score = 0.5*$j + 0.3*$cov_a + 0.2*$cov_b;
  return ($score, $inter, $j, $cov_a, $cov_b);
}

print "Fuzzy candidates for missing titles (top 5)\n";
for my $mt (@missing) {
  my $mtoks = tokenize($mt);
  my @cands;
  for my $be (@bib) {
    my $btoks = tokenize($be->{title});
    my ($score,$inter,$j,$ca,$cb) = score_pair($mtoks,$btoks);
    next if $inter == 0;
    push @cands, { score=>$score, inter=>$inter, j=>$j, ca=>$ca, cb=>$cb,
                   key=>$be->{key}, year=>$be->{year}, btitle=>$be->{title} };
  }
  @cands = sort { $b->{score} <=> $a->{score} } @cands;
  splice @cands, 5 if @cands > 5;
  print "\n- Missing: \"$mt\"\n";
  if (!@cands) { print "  (no reasonable candidates)\n"; next; }
  for my $i (0..$#cands) {
    my $c = $cands[$i];
    my $conf = sprintf('%.2f',$c->{score});
    my $jacc = sprintf('%.2f',$c->{j});
    my $ca = sprintf('%.2f',$c->{ca});
    my $cb = sprintf('%.2f',$c->{cb});
    my $bt = $c->{btitle}; $bt =~ s/\s+/ /g; $bt =~ s/^\s+|\s+$//g;
    print "  $conf  @".$c->{key}."  ($c->{year})  title: $bt  [jacc:$jacc ca:$ca cb:$cb inter:$c->{inter}]\n";
  }
}

