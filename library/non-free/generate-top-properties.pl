#!/usr/bin/perl -w

use lib "/var/lib/myfrdcsa/codebases/minor/action-planner";

use ActionPlanner::Util::AnalyzeOffline;
use PerlLib::SwissArmyKnife;

my $rows = RunAnalysis();
print Dumper($rows->[0]);
my ($count,$index,$def,$idef,$source,$isource) = @{GetData()};

foreach my $key (sort {$count->{$b} <=> $count->{$a}} keys %$count) {
  # print Dumper([$count->{$key},$idef->{$key},$key]);
  print $count->{$key}."\t".$idef->{$key}."\t".$key."\n";
}
