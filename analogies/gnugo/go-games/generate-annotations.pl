#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

foreach my $file (split /\n/, `ls -1 repo/`) {
  my $original = "repo/".$file;
  my $annotated = "annotated/".basename($file);
  if (! -f $annotated) {
    my $command = "gnugo --level 15 --output-flags dv --replay both -l ".shell_quote($original)." -o ".shell_quote($annotated); 
    print $command."\n";
    system $command;
    print "\n";
  }
}
