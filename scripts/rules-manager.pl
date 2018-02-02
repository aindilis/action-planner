#!/usr/bin/perl -w

use BOSS::Config;
use PerlLib::Lisp;
use PerlLib::SwissArmyKnife;

$specification = q(
	-l		List existing searches
	-d <depth>	Number or results to include in search
	--or		Split the topic into a bunch of tokens ORed together
	<search>...	Searches to be acted upon
);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;
# $UNIVERSAL::systemdir = "/var/lib/myfrdcsa/codebases/minor/system";

if (! exists $conf->{'--or'}) {

}

my $index = {};
my $alltags = {};

# parse out the rules and index by their primitives, such as their
# effects and their preconditions

# see if the Jena system does something like that already

my @clpfiles;
foreach my $file (split /\n/, `find /var/lib/myfrdcsa/codebases/minor/action-planner/subsystems/electrofriend-expert-system/custom-clips-domains/domains`) {
  if ($file =~ /\.clp$/) {
    push @clpfiles, $file;
  }
}

foreach my $file (@clpfiles) {
  ProcessFile(File => $file);
}

print Dumper([$index,$alltags]);

sub ProcessFile {
  my %args = @_;
  my $c = read_file($args{File});
  my $structure = LispStringToLispStructure
    (LispString => "(".$c.")");
  print Dumper
    ({File => $args{File},
      Structure => $structure});
  foreach my $item (@$structure) {
    if ($item->[0] eq "defrule") {
      $state = "0";
      my $title;
      my @conditions;
      my @effects;
      my $tags = {};
      foreach my $item2 (@$item) {
	my $ref = ref $item2;
	if ($state eq "0") {
	  if ($ref eq "ARRAY") {
	    print "ERROR 1\n";
	  } elsif ($ref eq "") {
	    if ($item2 eq "defrule") {
	      $state = "1";
	    }
	  }
	} elsif ($state eq "1") {
	  $title = $item2;
	  $state = "start";
	} elsif ($state eq "start") {
	  if ($ref eq "ARRAY") {
	    $state = "conditions";
	    push @conditions, $item2;
	  } elsif ($ref eq "") {
	    if ($item2 eq "=>") {
	      $state = "effects";
	    }
	  }
	} elsif ($state eq "conditions") {
	  if ($ref eq "ARRAY") {
	    push @conditions, $item2;
	  } elsif ($ref eq "") {
	    if ($item2 eq "=>") {
	      $state = "effects";
	    }
	  }
	} elsif ($state eq "effects") {
	  if ($ref eq "ARRAY") {
	    if ($item2->[0] eq "tag") {
	      $tags->{$item2->[1]} = 1;
	    } else {
	      push @effects, $item2;
	    }
	  }
	}
      }
      Update
	(
	 Title => $title,
	 Conditions => \@conditions,
	 Effects => \@effects,
	 Tags => $tags,
	);

    }
  }
}

sub Update {
  my %args = @_;
  # $args{Title}
  foreach my $condition (@{$args{Conditions}}) {
    my $cond = LispStructureToLispString(LispStructure => $condition);
    $index->{$cond}->{$args{Title}} = 1;
    foreach my $tag (keys %{$args{Tags}}) {
      $alltags->{$tag}->{$args{Title}} = 1;
    }
  }
}
