#!/usr/bin/perl -w

use PerlLib::SwissArmyKnife;
use PerlLib::HTMLConverter;

use Lingua::EN::Sentence qw(get_sentences);

my $c = read_file("Organize-Paperwork-at-Home");

my $htmlconverter = PerlLib::HTMLConverter->new();

# steps, tips, Related wikiHows,
if ($c =~ /<div id="steps"(.+?)<div id="tips"(.+?)<div id="relatedwikihows"(.+?)<div id="article_info"/s) {
  my $steps = $1;
  my $tips = $2;
  my $relatedwikihows = $3;
  # my $articleinfo = $4;
  my $steps = ExtractLIs(Text => $steps);
  ExtractConditions(Steps => $steps);
  print Dumper();
  print Dumper(ExtractLIs(Text => $tips));
  print Dumper(ExtractLIs(Text => $relatedwikihows, SkipConvert => 1));
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
}
