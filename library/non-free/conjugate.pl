#!/usr/bin/perl -w

use Lingua::EN::Conjugate qw(past);


my $sent = [
	    "BIKES MAY BE DESIGN -ED FOR USE.",
	    "A BIKE MAY BE CONVERT -ED TO A SINGLESPEED.",
	    "A BIKE MAY BE USE -ED FREQUENTLY.",
	    "ANYTHING MAY BE DISCARD -ED.",
	   ];

foreach my $s (@$sent) {
  print FixPastTense(Sentence => $s)."\n";
}

sub FixPastTense {
  my %args = @_;
  my $s = $args{Sentence};
  if ($s =~ /^(.*)\s(.+?)\s\-ED(.*?)$/) {
    my $start = $1;
    my $tochange = lc($2);
    my $end = $3;
    return $start." ".uc(past($tochange)).$end;
  } else {
    return $s;
  }
}
