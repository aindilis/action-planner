#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;
use Text::Capitalize;

my $c = read_file('/var/lib/myfrdcsa/codebases/minor/action-planner/library/non-free/chosen-properties.txt');
my @hashes;
my @newproperties;
foreach my $line (split /\n/, $c) {
  if ($line =~ /^(\d+)\s+(\(.+?\))\s+(.+?)$/) {
    my $property = $2;
    my $tmpproperty = $property;
    $tmpproperty =~ s/^\(//;
    $tmpproperty =~ s/\)$//;
    my @property = split(/\s+/, $tmpproperty);
    my $pred = shift @property;
    my @words = split /-/, $pred;
    my $firstword = shift @words;
    my $predicate = $firstword.join('', map {capitalize($_)} @words);
    my @args;
    my @additionalaxioms;
    foreach my $arg (@property) {
      $arg =~ s/^\?//;
      # push @additionalaxioms, 'isa('.capitalize($arg).','.$arg.')';
      push @args, capitalize($arg);
    }
    my $newproperty = $predicate.'('.join(',',@args).')';
    my $hash =
      {
       Count => $1,
       Property => $property,
       NewProperty => $newproperty,
       Desc => $3,
      };
    push @hashes, $hash;
    push @newproperties, $newproperty;
    push @newproperties, @additionalaxioms;
  }
}

# print Dumper(\@hashes);
# print Dumper([@newproperties]);
print join("\n", @newproperties)."\n";
