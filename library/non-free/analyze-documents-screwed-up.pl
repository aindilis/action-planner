#!/usr/bin/perl -w

use BOSS::Config;

use PerlLib::Cacher;
use PerlLib::HTMLConverter;
use PerlLib::SwissArmyKnife;
use PerlLib::URIExtractor;

use Lingua::EN::Conjugate qw(past);
use Lingua::EN::Inflect;
use Lingua::EN::Sentence qw(get_sentences);

$specification = q(
	-a		Analyze documents with KNext to extract properties, etc.
);

my $config =
  BOSS::Config->new
  (Spec => $specification);
my $conf = $config->CLIConfig;

my $c = read_file("table-of-contents.txt");

my $cacher = PerlLib::Cacher->new(Namespace => "action-planner-wikihow");
my $cacher2 = PerlLib::Cacher->new(Namespace => "action-planner-wikihow-pages");
my $htmlconverter = PerlLib::HTMLConverter->new();

foreach my $line (split /\n/, $c) {
  my $search = join("+",split / /, $line);
  my $url = "http://www.wikihow.com/Special:LSearch?search=$search";
  print "Page ".$url."\n";
  $cacher->get($url);
  if (! $cacher->is_cached) {
    sleep 10;
  }
  ExtractPages(Contents => $cacher->content);
}

sub ExtractPages {
  my %args = @_;
  my $c = $args{Contents};
  my $uris = ExtractURIs($c);
  my $count = 0;
  foreach my $uri (@$uris) {
    if ($uri =~ /^http:\/\/www.wikihow.com\/[A-Za-z0-9-]+$/) {
      next if $uri eq "http://www.wikihow.com/Main-Page";
      $count++;
      last if $count >= 4;
      print "Grabbing $count ".$uri."\n";
      my $filename = $uri;
      $filename =~ s/.*wikihow.com\///;
      $filename = "/var/lib/myfrdcsa/codebases/minor/action-planner/library/non-free/data/".$filename."_version_1.txt";
      if (! -f $filename) {
	print "Filename ".$filename."\n";
	$cacher2->get($uri);
	if (! $cacher2->is_cached) {
	  sleep 10;
	}
	# now analyze this document
	if (exists $conf->{'-a'}) {
	  ExtractDocument
	    (
	     URI => $uri,
	     Contents => $cacher2->content,
	     Filename => $filename,
	    );
	}
      }
    }
  }
}

# now we want to extract the items in this how to and process with the
# appropriate text processing

sub ExtractDocument {
  my %args = @_;
  my $c = $args{Contents};
  # steps, tips, Related wikiHows,
  if ($c =~ /<div id="steps"(.+?)<div id="tips"(.+?)<div id="relatedwikihows"(.+?)<div id="article_info"/s) {
    my $steps = $1;
    my $tips = $2;
    my $relatedwikihows = $3;
    # my $articleinfo = $4;
    my $steps = ExtractLIs(Text => $steps);
    ExtractConditions
      (
       Steps => $steps,
       URI => $args{URI},
       Filename => $args{Filename},
      );
    print Dumper(ExtractLIs(Text => $tips));
    print Dumper(ExtractLIs(Text => $relatedwikihows, SkipConvert => 1));
  }
}

sub ExtractLIs {
  my %args = @_;
  $text = $args{Text};
  # print $text."\n";
  my @items = $text =~ /(.*?)<li>(.+?)<\/li>(.*?)/sg;
  my @final;
  while (@items) {
    my $bad1 = shift @items;
    my $good = shift @items;
    my $bad2 = shift @items;
    if ($args{SkipConvert}) {
      push @final, $good;
    } else {
      push @final, $htmlconverter->ConvertToTxt(Contents => $good);
    }
  }
  return \@final;
}

sub ExtractConditions {
  my %args = @_;
  my @sentences;
  foreach my $step (@{$args{Steps}}) {
    $step =~ s/\s*\d+\s*//;
    $step =~ s/ \././g;
    my $sent = get_sentences($step);
    push @sentences, @$sent;
  }
  print Dumper(\@sentences);
  my @final;
  foreach my $sentence (@sentences) {
    $sentence =~ s/[\n\r]+/ /sg;
    $sentence =~ s/\s+/ /g;
    push @final, $sentence;
  }
  # now we want to process this with KNext
  # output to a data dir

  my $filename = $args{Filename};
  my $fh = IO::File->new();
  if ($fh->open(">$filename")) {
    print $fh join("\n", @final);
  } else {
    warn "cannot open $filename\n";
  }
  if (-f $filename) {
    my $newfilename = "$filename.knext.dat";
    if (! -f $newfilename) {
      my $command = "/var/lib/myfrdcsa/codebases/minor/free-knext/knext.pl -d  --no-formalize -s \"every few sentences\" -f ".shell_quote($filename);
      print $command."\n";
      system $command;
    }
    if (-f $newfilename) {
      # extract the item here now
      ProcessKNextDatFile
	(
	 Filename => $filename,
	 NewFilename => $newfilename,
	);
    }
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
      }
    }
  }
  print Dumper(\@sentences);
  my @formulae;
  foreach my $s (@sentences) {
    if (0) {
      print "\n";
      print "$s\n";
    }
    if ($s =~ /^(AN? )?(.+?) CAN BE (.+?)\.$/) {
      my $alpha = $1;
      my $a = $2;
      my $b = $3;
      if (! defined($alpha) and $a =~ /e?s$/i) {
	$a =~ s/ies$/Y/i;
	$a =~ s/e?s//i;
      }
      my $formula = ["is-".Fix(String => $b), "?".Fix(String => $a)];
      push @formulae, "(".join(" ",@$formula).")";
    } elsif ($s =~ /(AN? )?(.+?) MAY (.+?)\.$/) {
      my $alpha = $1;
      my $a = $2;
      my $b = $3;
      if (! defined($alpha) and $a =~ /e?s$/i) {
	$a =~ s/ies$/Y/i;
	$a =~ s/e?s//i;
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
      my $formula = [Fix(String => $b), "?".Fix(String => $a)];
      push @formulae, "(".join(" ",@$formula).")";
    } else {
      print "unk: $s\n";
    }
  }
  my $fh2 = IO::File->new();
  if ($fh2->open(">".$args{Filename}.".properties.txt")) {
    print $fh2 join("\n",@formulae)."\n";
    $fh2->close();
  }
}

sub Fix {
  my %args = @_;
  $args{String} =~ s/ /-/g;
  return lc($args{String});
}
