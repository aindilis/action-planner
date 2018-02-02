#!/usr/bin/perl -w

use Capability::Tokenize;
use PerlLib::SwissArmyKnife;

my $c = read_file("/var/lib/myfrdcsa/codebases/minor/action-planner/subsystems/electrofriend-expert-system/custom-clips-domains/domains/extension-0.clp");

my @items = $c =~ /\(defrule ([a-zA-Z0-9-_]+)\s+"(.*?)"/sg;
# print Dumper(\@items);

while (@items) {
  my $title = shift @items;
  my $desc = shift @items;
  $desc =~ s/[\n\r]+/ /g;
  $desc =~ s/\s+/ /g;
  if ($desc =~ /./) {
    print $desc."\n";
    my $res = NonServerLogicForm(Text => $desc);
    print "$res\n";
  }
}

sub NonServerLogicForm {
  my (%args) = @_;
  open (OUT, ">/tmp/candctext") or die "death!\n";
  print OUT tokenize_treebank($args{Text});
  close (OUT);
  my $dir = `pwd`;
  chdir "/var/lib/myfrdcsa/sandbox/candc-1.00/candc-1.00";
  system "bin/candc --input /tmp/candctext --models models/boxer > /tmp/test.ccg";
  my $res = `bin/boxer --input /tmp/test.ccg --box true --flat true`;
  return CleanUp(Result => $res);
}

sub CleanUp {
  my (%args) = @_;
  # clean the text up nicely
  return $args{Result};
}
