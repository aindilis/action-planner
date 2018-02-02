#!/usr/bin/perl -w

# bugs

# present tense?
# (undergo-a-restoration ?equipment) 

# seemingly bad usage
# (has-character ?person ?character)

#	             (spread-in-a-country ?bike)	                    BIKES MAY SPREAD IN A COUNTRY.	(THESE BIKES ARE RAPIDLY SPREADING IN CHINA COMMA JAPAN COMMA AND MANY OTHER COUNTRIES OF THE WORLD)
# 	            (was-did ?portions-of-tasks)	                  PORTIONS OF TASKS MAY BE DO -ED.	(SMALL PORTIONS OF THE FUTURE TASKS WILL HAVE BEEN DONE AHEAD OF TIME)
#	      (acclimate-to-a-situation ?person)	            A PERSON MAY ACCLIMATE TO A SITUATION.	(IT SHOULD PASS WITHIN ONE TO THREE WEEKS AS THE HORMONES STABILIZE AND YOU ACCLIMATE TO THE NEW SITUATION)
#             (has-acclimated-to-situation ?person ?situation)

use PerlLib::SwissArmyKnife;

use Lingua::EN::Conjugate qw(past);
use Lingua::EN::Inflect::Number qw(to_S);

my $index = {};
my $def = {};
my $idef = {};
my $source = {};
my $isource = {};

foreach my $file (split /\n/, `find /var/lib/myfrdcsa/codebases/minor/action-planner/library/non-free/data`) {
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
	$source->{$s} = $hash->{Sentence};
	$isource->{$hash->{Sentence}} = $s;
      }
    }
  }
  print Dumper(\@sentences);
  my @formulae;
  foreach my $s (@sentences) {
    my $s2 = FixPastTense(Sentence => $s);
    if (0) {
      print "\n";
      print "$s\n";
    }
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
      print "unk: $s\n";
    }
  }
  my $fh2 = IO::File->new();
  if ($fh2->open(">".$args{Filename}.".properties2.txt")) {
    print $fh2 join("\n",@formulae)."\n";
    $fh2->close();
  }
}

sub Fix {
  my %args = @_;
  $args{String} =~ s/ /-/g;
  return lc($args{String});
}

# generate index file
my $fh3 = IO::File->new();
if ($fh3->open(">all-properties.txt")) {
  foreach my $key (sort keys %$index) {
    print $fh3 "$key\n";
    foreach my $key2 (sort keys %{$index->{$key}}) {
      print $fh3 sprintf("\t%40s\t%50s\t%s\n",$key2,$def->{$key2},$source->{$def->{$key2}});
    }
    print $fh3 "\n";
  }
  $fh3->close();
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
