#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

my $added = {};

foreach my $file (split /\n/, `find /var/lib/myfrdcsa/codebases/minor/action-planner/library/non-free/data`) {
  if ($file =~ /^(.+)\.knext\.dat$/) {
    my $filename = $1;
    my $newfilename = $file;
    ProcessKNextDatFile
      (
       Filename => $filename,
       NewFilename => $newfilename,
      );
  }
}
foreach my $question (sort keys %$added) {
  print $question."\n";
}



sub ProcessKNextDatFile {
  my %args = @_;
  my $c = read_file($args{NewFilename});
  my @sentences;
  eval $c;
  foreach my $hash (@$VAR1) {
    foreach my $hash2 (@{$hash->{ExtractedKnowledge}}) {
      my $s = $hash2->{Sentence};
      if ($s =~ /^A PERSON MAY (.+)\.$/) {
	$added->{"DO YOU ".$1."?"} = 1;
      }
    }
  }
}

