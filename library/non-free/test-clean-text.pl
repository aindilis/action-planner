#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

foreach my $file (split /\n/, `ls /var/lib/myfrdcsa/codebases/minor/action-planner/library/non-free/data/*_version_1.txt`) {
  my $c = read_file($file);
  foreach my $line (split /\n/, $c) {
    my $text = CleanText(Text => $line);
    print $text."\n";
  }
}

sub CleanText {
  my %args = @_;
  my $text = $args{Text};
  $text =~ s/[^A-Za-z0-9\s,;:\.-]/ /g;
  $text =~ s/^\s*//;
  $text =~ s/\s*$//;
  $text =~ s/\s+/ /g;
  return $text;
}
