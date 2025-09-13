#!/usr/bin/env perl
use strict;
use warnings;

sub norm {
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

# Parse zotero.bib
open my $B, '<', 'zotero.bib' or die "Cannot open zotero.bib: $!";
my %bib; # norm_title -> array of [key, year, raw_title]
my ($key, $buf, $depth) = (undef, '', 0);
while (my $line = <$B>) {
  if (!defined $key) {
    if ($line =~ /@\w+\s*\{\s*([^,\s]+)\s*,/) {
      $key = $1;
      $buf = $line;
      $depth = () = $line =~ /\{/g;
      $depth -= () = $line =~ /\}/g;
      next;
    }
  } else {
    $buf .= $line;
    $depth += () = $line =~ /\{/g;
    $depth -= () = $line =~ /\}/g;
    if ($depth <= 0) {
      # process entry
      my $entry = $buf;
      my ($title, $year);
      # extract title field (balanced braces or quotes)
      if ($entry =~ /\btitle\s*=\s*([\{\"])\s*/i) {
        my $q = $1;
        my $rest = $';
        if ($q eq '{') {
          my $lvl = 1; my $t = '';
          foreach my $ch (split //, $rest) {
            if ($ch eq '{') { $lvl++; $t .= $ch; }
            elsif ($ch eq '}') { $lvl--; last if $lvl==0; $t .= $ch; }
            else { $t .= $ch; }
          }
          $title = $t;
        } else {
          ($title) = $rest =~ /(.*?)\"/s;
        }
      }
      ($year) = $entry =~ /\bdate\s*=\s*\{(\d{4})/i;  
      if (!$year) { ($year) = $entry =~ /\byear\s*=\s*\{(\d{4})/i; }
      if (defined $title) {
        $title =~ s/[\n\r]+/ /g; $title =~ s/\s+/ /g; $title =~ s/^\s+|\s+$//g;
        my $n = norm($title);
        push @{$bib{$n}}, [$key, ($year // ''), $title];
      }
      # reset
      $key = undef; $buf = ''; $depth = 0;
    }
  }
}
close $B;

# Extract titles from content/table.typ
open my $T, '<', 'content/table.typ' or die $!;
my @titles;
while (my $line = <$T>) {
  $line =~ s/^\s+|\s+$//g;
  if ($line =~ /^\[(.*)\],\s*$/) {
    my $c = $1;
    next if $c =~ /\*Q\*/;
    next if $c =~ /^I{1,3}$|^IV$/;
    my $title;
    if ($c =~ /^#link\(\"[^\"]*\"\)\[(.*)\]$/) {
      $title = $1;
    } elsif ($c ne '*Paper Title*') {
      $title = $c;
    }
    push @titles, $title if defined $title;
  }
}
close $T;

# Match each title to a key
my @found; my @missing;
for my $t (@titles) {
  my $nt = norm($t);
  my $m = $bib{$nt};
  if ($m && @$m) {
    my @sorted = sort { ($b->[1] cmp $a->[1]) } @$m;
    my $best = $sorted[0];
    push @found, [$t, @$best];
    next;
  }
  # substring + token-overlap heuristic
  my @cands;
  for my $bt (keys %bib) {
    if (index($bt,$nt) >= 0 || index($nt,$bt) >= 0) {
      push @cands, map { [$bt, @$_] } @{$bib{$bt}};
    }
  }
  # If no substring candidates, compute token overlap against all
  if (!@cands) {
    my @ntoks = split /\s+/, $nt;
    my %ntset = map { $_ => 1 } @ntoks;
    my $best; my $bestscore = 0; my $bestover = 0; my $bestlen = @ntoks || 1;
    while (my ($bt, $arr) = each %bib) {
      my @btoks = split /\s+/, $bt;
      my %btset = map { $_ => 1 } @btoks;
      my $overlap = 0; $overlap++ for grep { $ntset{$_} } keys %btset;
      my $score = $overlap / (scalar(@ntoks) || 1);
      # require at least 5 overlapping tokens to be safe, and >= 0.5 coverage
      if ($overlap >= 5 && $score >= 0.5 && $score > $bestscore) {
        $bestscore = $score; $bestover = $overlap; $bestlen = scalar(@ntoks);
        # pick the newest year among this bt cluster
        my @sorted = sort { ($b->[1] cmp $a->[1]) } @$arr;
        $best = [$bt, @{$sorted[0]}];
      }
    }
    @cands = ($best) if $best;
  }
  if (@cands == 1) {
    push @found, [$t, $cands[0]->[1], $cands[0]->[2], $cands[0]->[3]];
  } elsif (@cands > 1) {
    my %ntoks = map { $_=>1 } split /\s+/, $nt;
    my ($best,$bestscore) = (undef, -1);
    for my $c (@cands) {
      my $bt = $c->[0];
      my $score = 0; $score++ for grep { $ntoks{$_} } split /\s+/, $bt;
      if ($score > $bestscore) { $bestscore = $score; $best = $c; }
    }
    if ($best) { push @found, [$t, $best->[1], $best->[2], $best->[3]]; }
    else { push @missing, $t; }
  } else {
    push @missing, $t;
  }
}

print "FOUND:\n";
for my $r (@found) {
  my ($t,$k,$y,$raw) = @$r;
  print "$t\t$k\t$y\n";
}
print "MISSING:\n";
print join("\n", @missing), "\n";

# Emit table-ready lines in original order
my %key_for;
for my $r (@found) { my ($t,$k,$y,$raw) = @$r; $key_for{$t} = $k; }
print "\nSERIAL:\n";
for my $t (@titles) {
  if (exists $key_for{$t}) {
    print "[\"$t\" ".$key_for{$t} ."],\n";
  } else {
    print "[\"$t\"],\n";
  }
}
