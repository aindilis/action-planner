package ActionPlanner::Util::AnalyzeOffline;

use BOSS::Config;
use PerlLib::SwissArmyKnife;
use Verber::Ext::PDDL::Domain;
use Verber::Ext::PDDL::Problem;

use Lingua::EN::Conjugate qw(past);
use Lingua::EN::Inflect::Number qw(to_S);

require Exporter;
@ISA = qw(Exporter);
@EXPORT = qw (RunAnalysis GetData);

my $count = {};
my $index = {};
my $def = {};
my $idef = {};
my $source = {};
my $isource = {};

sub RunAnalysis {
  my %args = @_;
  $rowsdatfile = "rows.dat";
  if (! -f $rowsdatfile) {
    my $dir = shell_quote($args{Directory});
    foreach my $file (split /\n/, `find $dir`) {
      if ($file =~ /^(.+)\.knext\.dat$/) {
	my $filename = $1;
	my $newfilename = $file;
	ProcessKNextDatFile
	  (
	   Filename => $filename,
	   NewFilename => $newfilename,
	  );
      }
    }
    my $fh = IO::File->new();
    if ($fh->open(">$rowsdatfile")) {
      print $fh Dumper([$count,$index,$def,$idef,$source,$isource]);
      $fh->close();
    }
  } else {
    my $c = read_file($rowsdatfile);
    eval $c;
    $count = $VAR1->[0];
    $index = $VAR1->[1];
    $def = $VAR1->[2];
    $idef = $VAR1->[3];
    $source = $VAR1->[4];
    $isource = $VAR1->[5];
  }
  my @rows;
  # generate index file
  foreach my $key (sort keys %$index) {
    foreach my $key2 (sort keys %{$index->{$key}}) {
      push @rows, [$key,$key2,$def->{$key2},$count->{$def->{$key2}},[keys %{$source->{$def->{$key2}}}]];
    }
  }
  return {
	  Rows => \@rows,
	  Index => $index,
	  Source => $source,
	  Def => $def,
	 };
}

sub ProcessKNextDatFile {
  my %args = @_;
  my $c = read_file($args{NewFilename});
  my @sentences;
  eval $c;
  foreach my $hash (@$VAR1) {
    foreach my $hash2 (@{$hash->{ExtractedKnowledge}}) {
      my $s = $hash2->{Sentence};
      if ($s =~ /[A-Z]/ and $s ne "NIL" and $s !~ /^Break/) {
	push @sentences, $s;
	$count->{$s}++;
	$source->{$s}->{$hash->{Sentence}} = 1;
	$isource->{$hash->{Sentence}}->{$s} = 1;
      }
    }
  }
  my @formulae;
  foreach my $s (@sentences) {
    my $s2 = FixPastTense(Sentence => $s);
    if ($s2 =~ /^(AN? )?(.+?) CAN BE (.+?)\.$/) {
      my $alpha = $1;
      my $a = $2;
      my $b = $3;
      if (! defined($alpha) and $a =~ /e?s$/i) {
	$a = to_S($a);
	# $a =~ s/ies$/Y/i;
	# $a =~ s/e?s$//i;
      }
      my $formula = ["is-".Fix(String => $b), "?".Fix(String => $a)];
      push @formulae, "(".join(" ",@$formula).")";
    } elsif ($s2 =~ /(AN? )?(.+?) MAY (.+?)\.$/) {
      my $alpha = $1;
      my $a = $2;
      my $b = $3;
      if (! defined($alpha) and $a =~ /e?s$/i) {
	$a = to_S($a);
	# $a =~ s/ies$/Y/i;
	# $a =~ s/e?s$//i;
      }
      if (1) {
	my @words = split / /, $b;
	my $mainword = shift @words;
	if (1) {
	  my $substitute =
	    {
	     "have" => "has",
	     "be" => "was",
	    };
	  if (exists $substitute->{lc($mainword)}) {
	    $mainword = $substitute->{lc($mainword)};
	  }
	}
	# past("to ".$mainword)
	my @new;
	push @new, $mainword;
	push @new, @words;
	$b = join(" ",@new);
      }
      # check whether it's in the format has-a-list ?person, so that we can add a ?list at the end
      my $formula;
      my $string;
      if ($b =~ /^has an? (.+)$/i) {
	my $secondary = $1;
	my $pred = Fix(String => "has ".$secondary);
	my $var1 = "?".Fix(String => $a);
	my $var2 = "?".Fix(String => $secondary);
	$formula = [$pred, $var1, $var2];
	$string = "(".join(" ",@$formula).")";
	$index->{$pred}->{$string} = 1;
	$index->{$var1}->{$string} = 1;
	$index->{$var2}->{$string} = 1;
      } else {
	my $pred = Fix(String => $b);
	my $var1 = "?".Fix(String => $a);
	$formula = [$pred, $var1];
	$string = "(".join(" ",@$formula).")";
	$index->{$pred}->{$string} = 1;
	$index->{$var1}->{$string} = 1;
      }
      $def->{$string} = $s;
      $idef->{$s} = $string;

      push @formulae, $string;;
    } else {
    }
  }
}

sub Fix {
  my %args = @_;
  $args{String} =~ s/ /-/g;
  return lc($args{String});
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

sub GetData {
  my %args = @_;
  return [$count,$index,$def,$idef,$source,$isource];
}

1;
