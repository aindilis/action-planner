#!/usr/bin/perl -w

use Data::Dumper;

# java -cp CLIPSJNI.jar -Djava.library.path=. CLIPSJNI.Environment

# Some methods are: clear, reset, load, loadFacts, run, eval, build,
# assertString, makeInstance

use Inline Java => <<'END_OF_JAVA_CODE',
import CLIPSJNI.*;

class Pod_alu {
   Environment clips;

   public Pod_alu(){
      clips = new Environment();
   }

   public void assertString(String s){
      clips.assertString(s);
   }

   public void load(String s) {
      clips.load(s);
   }

   public void reset() {
      clips.reset();
   }

   public PrimitiveValue eval(String s) {
      return clips.eval(s);
   }

   public void destroy() {
      clips.destroy();
   }

   public void run() {
      clips.run();
   }

   public String findAllFacts(String s1, String s2){
      String evalStr = "(find-all-facts ((?f " + s1 + ")) TRUE)";
      String result = "";
      try
         { result = eval(evalStr).get(0).getFactSlot(s2).toString(); }
      catch (Exception e)
         { e.printStackTrace(); }
      return result;
   }
}
END_OF_JAVA_CODE
  AUTOSTUDY => 1,
  CLASSPATH => '/var/lib/myfrdcsa/sandbox/clipsjni-0.3/clipsjni-0.3/CLIPSJNI.jar',
  EXTRA_JAVA_ARGS => '-Djava.library.path=/var/lib/myfrdcsa/sandbox/clipsjni-0.3/clipsjni-0.3';

my $alu = new Pod_alu() ;
foreach my $domain ("domains/functions.clp","domains/extension-0.clp","domains/extension-1.clp",
   "domains/extension-2.clp","situations/situation-1.clp")
  {
  $alu->load("/var/lib/myfrdcsa/codebases/minor/action-planner/subsystems/electrofriend-expert-system/custom-clips-domains/".$domain);
}
$alu->reset;
$alu->run;
$alu->eval("(facts)");

# $alu->assertString("(has-car AndrewDougherty)");

