#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

my $edittedpropertiesfile = "editted.txt";
my $c1 = read_file($edittedpropertiesfile);
my $score = {};
foreach my $line (split /\n/, $c1) {
  if ($line =~ /^#####/) {
    last;
  } else {
    if ($line =~ /^(\d+)\s+(.+?)\t(.+)$/) {
      my $count = $1;
      my $property = $2;
      my $text = $3;
      foreach my $token (split /\W+/, $property) {
	if ($token !~ /^(was|is|has|person|individual)$/i) {
	  $score->{lc($token)} += $count;
	}
      }
    }
  }
}

my $rulesfile = "rules.txt";
my $c2 = read_file($rulesfile);
my $finalscores = {};
foreach my $line (split /\n/, $c2) {
  my @tokens = map {lc($_)} split /\W+/, $line;
  my $size = scalar @tokens;
  if ($size) {
    my $rulescore = 0;
    foreach my $token (@tokens) {
      if (exists $score->{$token}) {
	$rulescore += $score->{$token};
      }
    }
    my $finalscore = $rulescore / $size;
    $finalscores->{$line} = $finalscore;
  }
}

foreach my $line (sort {$finalscores->{$b} <=> $finalscores->{$a}} split /\n/, $c2) {
  print $finalscores->{$line}."\t".$line."\n";
}
