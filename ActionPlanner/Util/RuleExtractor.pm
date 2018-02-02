package ActionPlanner::Util::RuleExtractor;

use Capability::LogicForm;
use PerlLib::SwissArmyKnife;

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw (ExtractRules);

sub ExtractRules {
  my %args = @_;
  my $results = $args{Results};
  # print Dumper($results);
  my $isource = {};
  foreach my $key (keys %{$results->{Source}}) {
    foreach my $key2 (keys %{$results->{Source}->{$key}}) {
      $isource->{$key2}->{$key} = 1;
    }
  }
  my $idef = {};
  foreach my $key (keys %{$results->{Def}}) {
    $idef->{$results->{Def}->{$key}} = $key;
  }
  my $logicform = Capability::LogicForm->new
    (
     Fast => 0,
    );
  my $myresults = {};
  $logicform->StartServer();
  foreach my $key (keys %$isource) {
    # perform free logic form, and possibly shalamaneser on them
    my $res = $logicform->LogicForm
      (
       Text => $key,
       # Type => "Object",
       WSD => 0,
      );

    if ($res->{Success}) {
      if ($res->{Result}->[0]->{Success}) {
	my @lf;
	foreach my $part (@{$res->{Result}->[0]->{LogicForms}}) {
	  if ($part =~ /^(.+)\' \((.*)\)$/) {
	    my $pred = lc($1);
	    my $args = [split /,\s*/,$2];
	    my $tags = {};
	    foreach my $key2 (keys %{$isource->{$key}}) {
	      foreach my $token (split /\W+/, lc($key2)) {
		# print "<$pred> <$token>\n";
		if ($pred eq $token) {
		  $tags->{$idef->{$key2}} = 1;
		}
	      }
	    }
	    push @lf, [$pred,$args,$tags];
	  }
	}
	$myresults->{$key} = \@lf;
      }
    }
  }
  return $myresults;
}

1;
