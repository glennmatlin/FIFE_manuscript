#!/usr/bin/env perl
use strict; use warnings;

sub urlenc {
  my ($s) = @_;
  $s =~ s/([^A-Za-z0-9_.~-])/sprintf("%%%02X", ord($1))/seg;
  return $s;
}

sub norm { my($s)=@_; $s=lc $s; $s=~s/[^a-z0-9]+/ /g; $s=~s/\s+/ /g; $s=~s/^\s+|\s+$//g; $s; }
my %STOP = map { $_=>1 } qw(a an the and or of for to in on with without via by from into at as is are be have has using based small large model models language languages agent agents multi multiagent multi-agent game games framework benchmark evaluation evaluating study case approach method methods decision decisions making strategic strategy social negotiation negotiations real time deep reinforcement learning human humans ai llm llms);
sub toks { my($s)=@_; $s=norm($s); return [ grep { $_ ne '' && !$STOP{$_} } split(/\s+/, $s) ]; }
sub score_pair { my($a,$b)=@_; my %a=map{$_=>1} @$a; my %b=map{$_=>1} @$b; my $inter=0; $a{$_}&&$inter++ for keys %b; my $u= scalar(keys%a)+scalar(keys%b)-$inter; my $j=$u? $inter/$u:0; my $ca=@$a? $inter/@$a:0; my $cb=@$b? $inter/@$b:0; return ($j,$ca,$cb,$inter); }

my $file = shift @ARGV or die "usage: $0 titles.txt\n";
open my $F, '<', $file or die $!;
print "title,source,id\n";
while (my $t = <$F>) {
  chomp($t); next unless $t;
  my $tq = urlenc($t);
  # try arXiv title search, compute overlap
  my $aurl = "http://export.arxiv.org/api/query?search_query=ti:%22$tq%22&max_results=5";
  my $xml = qx(curl -m 12 -sL "$aurl");
  my $best_id=''; my $best_s=0; my $qt = toks($t);
  while ($xml =~ m|<entry>(.*?)</entry>|sg) {
    my $e=$1; my ($et) = $e =~ m|<title>\s*(.*?)\s*</title>|s; $et ||= '';
    $et =~ s/&amp;/&/g; $et =~ s/&lt;/</g; $et =~ s/&gt;/>/g; $et =~ s/\s+/ /g; $et =~ s/^\s+|\s+$//g;
    my ($id) = $e =~ m|<id>\s*http://arxiv\.org/abs/([^<\s]+)|s; next unless $id;
    my ($j,$ca,$cb,$inter) = score_pair($qt, toks($et));
    my $s = 0.5*$j + 0.3*$ca + 0.2*$cb;
    if ($s > $best_s) { $best_s = $s; $best_id = $id; }
  }
  if (!$best_id) {
    my $aurl2 = "http://export.arxiv.org/api/query?search_query=all:%22$tq%22&max_results=5";
    my $xml2 = qx(curl -m 12 -sL "$aurl2");
    while ($xml2 =~ m|<entry>(.*?)</entry>|sg) {
      my $e=$1; my ($et) = $e =~ m|<title>\s*(.*?)\s*</title>|s; $et ||= '';
      $et =~ s/&amp;/&/g; $et =~ s/&lt;/</g; $et =~ s/&gt;/>/g; $et =~ s/\s+/ /g; $et =~ s/^\s+|\s+$//g;
      my ($id) = $e =~ m|<id>\s*http://arxiv\.org/abs/([^<\s]+)|s; next unless $id;
      my ($j,$ca,$cb,$inter) = score_pair($qt, toks($et));
      my $s = 0.5*$j + 0.3*$ca + 0.2*$cb;
      if ($s > $best_s) { $best_s = $s; $best_id = $id; }
    }
  }
  if ($best_id && ($best_s >= 0.6)) { print "$t,arxiv,$best_id\n"; next; }
  my $curl = "https://api.crossref.org/works?query.title=$tq&rows=3";
  my $cr = qx(curl -m 12 -sL "$curl");
  my $best_doi=''; my $best_s=0; my $qt = toks($t);
  while ($cr =~ /\{[^{}]*?"DOI"\s*:\s*"([^"]+)"[^{}]*?"title"\s*:\s*\[\s*"([^"]+)"\s*\][^{}]*\}/sg) {
    my ($doi,$rt) = ($1,$2);
    my ($j,$ca,$cb,$inter) = score_pair($qt, toks($rt));
    my $s = 0.5*$j + 0.3*$ca + 0.2*$cb;
    if ($s > $best_s) { $best_s=$s; $best_doi=$doi; }
  }
  if ($best_doi && ($best_s >= 0.6)) { print "$t,doi,$best_doi\n"; } else { print "$t,none,\n"; }
}
