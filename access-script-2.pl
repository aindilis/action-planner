#!/usr/bin/perl -w

use System::CLIPS;

use Data::Dumper;

my $clips = System::CLIPS->new();
foreach my $domain ("domains/functions.clp","domains/extension-0.clp","domains/extension-1.clp",
   "domains/extension-2.clp","situations/situation-1.clp")
  {
  $clips->load("/var/lib/myfrdcsa/codebases/minor/action-planner/subsystems/electrofriend-expert-system/custom-clips-domains/".$domain);
}
$clips->reset;
$clips->run;

$clips->assertString("(has-car AndrewDougherty \"hi\nthere\")");

$clips->assertString("(has-car AndrewDougherty misc)");

print Dumper($clips->facts);
