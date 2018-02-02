#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

foreach my $file (split /\n/, `ls /var/lib/myfrdcsa/codebases/minor/action-planner/library/non-free/data/*_version_1.txt`) {
  my $c = read_file($file);
  foreach my $line (split /\n/, $c) {
    if ($line =~ /[^A-Za-z0-9\s,;:\.-]/) {
      print $line."\n";
    }
  }
}
