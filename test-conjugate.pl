#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

use Lingua::EN::Conjugate qw(conjugate past);

my $verb = 'bear';
my @be = conjugate
  (
   'verb'=> $verb,
   'tense'=>'past_perfect',
  );

print Dumper(\@be);

print past($verb)."\n";
