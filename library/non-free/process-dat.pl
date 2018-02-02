#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;
use Lingua::EN::Conjugate qw(past);

# use KBS2::ImportExport;

my $c = read_file("sample-knext-input.txt.knext.dat");

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

sub Fix {
  my %args = @_;
  $args{String} =~ s/ /-/g;
  return lc($args{String});
}

# my $ie = KBS2::ImportExport->new();

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
    print "(".join(" ",@$formula).")\n";
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
    print "(".join(" ",@$formula).")\n";
  } else {
    print "unk: $s\n";
  }
}
