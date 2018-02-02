#!/usr/bin/perl -w

use PerlLib::Cacher;
use PerlLib::SwissArmyKnife;
use PerlLib::URIExtractor;

my $cacher = PerlLib::Cacher->new(Namespace => "action-planner-wikihow");

my $c = read_file("sample.html");
my $uris = ExtractURIs($c);
my $count = 0;
foreach my $uri (@$uris) {
  if ($uri =~ /^http:\/\/www.wikihow.com\/[A-Za-z0-9-]+$/) {
    next if $uri eq "http://www.wikihow.com/Main-Page";
    $count++;
    last if $count > 5;
    print $uri."\n";
    $cacher->get($uri);
    if (! $cacher->is_cached) {
      sleep 10;
    }
  }
}


