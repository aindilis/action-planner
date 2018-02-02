#!/usr/bin/perl -w

use PerlLib::Cacher;
use PerlLib::SwissArmyKnife;
use PerlLib::URIExtractor;

my $c = read_file("table-of-contents.txt");

my $cacher = PerlLib::Cacher->new(Namespace => "action-planner-wikihow");
my $cacher2 = PerlLib::Cacher->new(Namespace => "action-planner-wikihow-pages");
foreach my $line (split /\n/, $c) {
  my $search = join("+",split / /, $line);
  my $url = "http://www.wikihow.com/Special:LSearch?search=$search";
  print $url."\n";
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
      last if $count >= 5;
      print "Grabbing $count ".$uri."\n";
      $cacher2->get($uri);
      if (! $cacher2->is_cached) {
	sleep 10;
      }
    }
  }
}
