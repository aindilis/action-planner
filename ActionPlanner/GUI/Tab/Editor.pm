package ActionPlanner::GUI::Tab::Editor;

use ActionPlanner::Util::AnalyzeOffline;
use ActionPlanner::Util::RuleExtractor;
use KBS2::Client;
use KBS2::Util;
use KBS2::Util::Metadata;
use Manager::Dialog qw(Approve ApproveCommands Message QueryUser QueryUser2);
use PerlLib::SwissArmyKnife;

use Class::ISA;
use Tk;
use Tk::TableMatrix;

use base qw(ActionPlanner::GUI::Tab);

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Context MyClient MyFrame MyMainWindow MyMenus Data Debug
	Database MyMetadata Tabname TableFrame MyTable /

  ];

sub init {
  my ($self,%args) = @_;
  # V3

  # Model
  $self->Tabname($args{Tabname});
  $self->Database($args{Database} || "freekbs2");
  $self->MyClient
    (KBS2::Client->new
     (Database => $self->Database));

  # View
  $self->MyFrame($args{Frame});
  $UNIVERSAL::managerdialogtkwindow = $UNIVERSAL::actionplanner->MyGUI->MyMainWindow;
  $self->MyFrame->pack(-expand => 1, -fill => 'both');
}

sub Execute {
  my ($self,%args) = @_;
  $self->TableFrame
    ($self->MyFrame->Frame());
  $self->TableFrame->pack(-fill => "both", -expand => 1);
  $self->Generate();
}

sub Generate {
  my ($self,%args) = @_;

  my $position;
  if (defined $self->MyTable) {
    # try to get the scroll position
    my $res = $self->MyTable->yview;
    $position = $res->[0];
  }

  print "Starting to refresh display\n";
  # remove any preexisting tables
  if (scalar $self->TableFrame->children) {
    $self->TableFrame->children->[0]->destroy;
  }

  # we need to load the various items here for testing

  # in edit mode, we have the ability to select which predicates from
  # all-whatever

  # in 

  # come up with the list of items, possible assertions, the snippet,
  # the sentences, etc.

  # do word sense assignments

  # have the ability to control which documents the user edits, so as
  # to get rid of certain not useful documents


  my @keys = ("keyword", "property","knext_sentence","count","original_sentence");
  my $propername =
    {
     keyword => "Keyword",
     property => "Property",
     knext_sentence => "KNext",
     count => "Count",
     original_sentence => "Original",
    };
  my $results = RunAnalysis
    (
     Directory => ($UNIVERSAL::actionplanner->Conf->{'--dir'} ||
     "/var/lib/myfrdcsa/codebases/minor/utility-maximization-system/data/csp")
    );
  my $rules = ExtractRules(Results => $results);
  print Dumper($rules);
  die("temporary ceasing");
  my $run = $results->{Rows};

  my $numberofrows = scalar @$run;

  # get the size
  my $table = $self->TableFrame->Scrolled
    (
     "TableMatrix",
     # -resizeborders => 'none',
     -titlerows => 1,
     -rows => $numberofrows,
     -colstretchmode => 'all',
     -cols => (scalar @keys),
     -cache => 1,
     -scrollbars => "osoe",
    );

  $table->bind("<Button-4>", sub { $table->yviewScroll(-3,"units") });
  $table->bind("<Button-5>", sub { $table->yviewScroll(3,"units") });

  # add some other stuff for other fields as needed

  my $col2 = 0;
  foreach my $fieldname (@keys) {
    # $table->insertCols("$col2.0", 1);
    $table->set("0,$col2", $propername->{$fieldname});
    ++$col2;
  }
  $table->colWidth(1, 15);
  $table->colWidth(2, 45);
  $table->colWidth(3, 50);
  $table->colWidth(4, 10);
  $table->colWidth(5, 60);

  my $row = 1;
  # sort by date first of all, not by number as if we use a limited format...  ID cannot be important

  foreach my $items (@$run) {
    my $col3 = 0;
    foreach my $item (@$items) {
      $table->set("$row,$col3", $item);
      ++$col3;
    }
    ++$row;
  }
  $table->pack
    (
     -expand => 1,
     -fill => 'both',
    );
  if (defined $position) {
    $table->yviewMoveto($position);
  }
  $self->MyTable($table);
  print "Finished refreshing display\n";

  if (0) {
    $self->MyMetadata
      (KBS2::Util::Metadata->new
       (
	Context => $self->Context,
	Assertions => [],
	# Debug => 1,
       ));
    $self->MyMetadata->LoadMetadata();
    my $assertions = $self->GetAllAssertions();
    $self->MyMetadata->ProcessAssertions
      (
       Assertions => $assertions,
      );
  }
}

1;
