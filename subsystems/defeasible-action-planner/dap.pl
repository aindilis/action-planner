#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;

my $actions =
  [
   "scan paperwork",
   "clean house",
   "clean computer room",
   "clean bathroom",
   "prepare food",
   "go to work",
   "do laundry",
  ];

my $states =
  [
   "paperwork is scanned",
   "house is cleaned",
   "computer room is cleaned",
   "bathroom is cleaned",
   "food is prepared",
   "work is done",
   "laundry is done",
  ];

my $preference = {};
$preference->{"paperwork is scanned"}->{"bathroom is cleaned"} = 1;
$preference->{"paperwork is scanned"}->{"house is cleaned"} = 1;
$preference->{"paperwork is scanned"}->{"computer room is cleaned"} = 1;
$preference->{"food is prepared"}->{"paperwork is scanned"} = 1;
$preference->{"food is prepared"}->{"work is done"} = 1;
$preference->{"work is done"}->{"paperwork is scanned"} = 1;
$preference->{"work is done"}->{"laundry is done"} = 1;

my $theorems =
  [
   ["after","scan paperwork","paperwork is scanned"],
   ["after","clean house","house is cleaned"],
   ["after","clean computer room","computer room is cleaned"],
   ["after","clean bathroom","bathroom is cleaned"],
   ["after","prepare food","food is prepared"],
   ["after","go to work","work is done"],
   ["after","do laundry","laundry is done"],
  ];

# my $new = [];
# foreach my $theorem (@$theorems) {
#   push @$new, ["after",sub {Choose("Is this true?: ".$theorem->[2])},$theorem->[2]];
# }

my $kba = {};
my $kbb = {};
my $desires = {};
foreach my $state (@$states) {
  $kba->{Dumper([$state])} = 0;
  $kba->{Dumper(["not",$state])} = 0;
  $desires->{$state} = 1;
}
my $goals;

# now generate the desired action given the world state

sub CheckKB {
  my %args = @_;
  if (exists $kba->{Dumper([$args{Fact}])} and $kba->{Dumper([$args{Fact}])}) {
    return "True";
  } elsif (exists $kbb->{Dumper(["not",$args{Fact}])} and $kbb->{Dumper(["not",$args{Fact}])}) {
    return "False";
  } else {
    return "Unknown";
  }
}

sub GenerateAppropriateAction {
  my %args = @_;
  # come up with a list of desires
  while (1) {
    $goals = {};
    foreach my $desire (keys %$desires) {
      # check the KB to see if it is true
      my $res = CheckKB(Fact => $desire);
      if ($res eq "True") {
	# it is already true, no reason to have a goal to accomplish it
      } elsif ($res eq "False") {
	# it is false, there should be a goal to accomplish it
	$goals->{Dumper($desire)} = 1;
      } elsif ($res eq "Unknown") {
	# it is not clear whether it is accomplished or not, there
	# should be a goal to determine it
	$goals->{Dumper(["determined-whether",$desire])} = 1;
      }
    }
    print Dumper($goals);
    # now invoke the planner
    Planner();
  }
}

sub Planner {
  my %args = @_;
  # take the goals, and try to accomplish them
  foreach my $goaldumper (keys %$goals) {
    my $goal = DeDumper($goaldumper);
    # now determine what to do with this
  }
  GetSignalFromUserToProceed();
}

GenerateAppropriateAction();
