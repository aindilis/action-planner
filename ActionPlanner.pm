package ActionPlanner;

use BOSS::Config;
use MyFRDCSA;
use PerlLib::SwissArmyKnife;
use ActionPlanner::GUI;

use Tk;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Config Conf MyMainWindow MyGUI MyConfiguration MyResources /

  ];

sub init {
  my ($self,%args) = @_;
  $specification = "
	-l			List available contexts
	-c <context>		Set the context for the current session

	-d			Run in debug mode
	--dir <dir>		The directory containing the .knext.dat files

	-u [<host> <port>]	Run as a UniLang agent

	-w			Require user input before exiting
";
  $UNIVERSAL::systemdir = ConcatDir(Dir("minor codebases"),"action-planner");
  $UNIVERSAL::agent->DoNotDaemonize(1);
  $self->Config
    (BOSS::Config->new
     (Spec => $specification,
      ConfFile => ""));
  $self->Conf($self->Config->CLIConfig);
  my $conf = $self->Conf;
  $UNIVERSAL::agent->DoNotDaemonize(1);
  if ($conf->{'-d'}) {
    $UNIVERSAL::debug = 1;
  }
  $UNIVERSAL::agent->Register
    (Host => defined $conf->{-u}->{'<host>'} ?
     $conf->{-u}->{'<host>'} : "localhost",
     Port => defined $conf->{-u}->{'<port>'} ?
     $conf->{-u}->{'<port>'} : "9000");
  $self->MyMainWindow
    (MainWindow->new
     (
      -title => "Action Planner",
      -width => 1024,
      -height => 768,
     ));
  $self->MyGUI
    (ActionPlanner::GUI->new
     (
      MyMainWindow => $self->MyMainWindow,
      ActionPlanner => $self,
     ));
}

sub Execute {
  my ($self,%args) = @_;
  my $conf = $self->Config->CLIConfig;
  if (exists $conf->{'-w'}) {
    Message(Message => "Press any key to quit...");
    my $t = <STDIN>;
  }
  $self->MyGUI->Execute();
  $self->MyMainWindow->geometry('1024x768');
  $self->MyMainLoop();
}

sub ProcessMessage {
  my ($self,%args) = @_;
  my $m = $args{Message};
  my $it = $m->Contents;
  if ($it) {
    if ($it =~ /^echo\s*(.*)/) {
      $UNIVERSAL::agent->SendContents
	(Contents => $1,
	 Receiver => $m->{Sender});
    } elsif ($it =~ /^add-goal (.+)$/i) {
      my $goal = $1;
      See(Goal => $goal);
      $UNIVERSAL::agent->SendContents
	(Contents => "Added Goal With Result $res: $goal",
	 Receiver => $m->{Sender});
      $UNIVERSAL::agent->UnListen;
    } elsif ($it =~ /^(quit|exit)$/i) {
      $UNIVERSAL::agent->Deregister;
      exit(0);
    }
  }
}

sub MyMainLoop {
  my ($self,%args) = @_;
  $self->MyMainWindow->repeat
    (
     50,
     sub {
       $self->AgentListen(),
     },
    );
  MainLoop();
}

sub AgentListen {
  my ($self,%args) = @_;
  # UniLang::Agent::Agent
  # print ".\n";
  $UNIVERSAL::agent->Listen
    (
     TimeOut => 0.05,
    );
}

1;
