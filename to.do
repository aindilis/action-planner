(If you don't take vitamins consider taking them)

(when Gondor's need was dire)

(expedient)

(
 http://en.wikipedia.org/wiki/Category:Social_work
 http://en.wikipedia.org/wiki/Public_welfare
 http://en.wikipedia.org/wiki/Category:Welfare
 http://en.wikipedia.org/wiki/Book:Social_work
 http://en.wikipedia.org/wiki/Systems_intelligence#Systems_intelligence_vs._systems_thinking

 Andy, your life planner AI software could make use of these. I'm interested in it too!
 Justin Coslor 7/10/2013
 )

(semantics
 ("I am not dying for six college credits" - Thor
  (note the semantics of for, how we can use that.  This
   commodity/state in exchange for that commodity/state.  Tradeoffs.)
  )
 )

(rules to add
 (if you have a tooth that needs to be pulled, and you don't have
 a lot of money try going to a dentistry school) 
 )

(Create a web based app to which users can submit snippets of
 text, along with associated proof of licenses, so that we can
 mine the text for rules that would help a person.)

(earthly cares)

(should use the functionality for tracking viewpoints to do
 epistemic reasoning and determine which rules to use on the basis
 of viewpoints)

(so there is the information gathering phase, then it generates a
 list of goals for you, similar in fact to the if then rule
 system I propose.)
(some goals are habitual)
(add the part that knows which process is ongoing)

(We want to have something that generates a set of goals for you
 based on your situation)


(Here is the basic layout
 (take the to.do list and convert it to PDDL/TAL using the method
  in the NLU w/ TAL paper) 
 (not sure PDDL can handle existential items)
 (develop a system that understands which states are generally
  desireable, etc, could probably use ConceptNet for some of
  this)
 (develop a test environment such as food preparation, make other
  test domains such as Go/Chess/Theorem Proving, etc.)  
 (develop a library of AI formalisms like TAL, etc, develop
  bindings for them) 
 )

(one possibility strategy is to look at behaviors / modus
 operandi of the rich, who ostensibly have "all their bases
covered", and then analyze these for ethical problems, so see
 where we can modify the "operating system" of the rich to apply
 for the poor.)

(interweave ITS technology)

(problem of death by GPS, over-reliance on technological systems,
 only used as decision aids)

(ontology of home economics)
(various microeconomics problems to solve:
 (The expenditure minimization problem)
 (The expected utility problem)
 )

(here is how we are going to approach this problem
 (we want to have a client that connects to the SPSE2 API and
  interacts with the model to generate a plan of action,
  basically a pretend user) 
 )

(Use some of these concepts from AI such as TAEB and Go to
 develop a rating of what I should be doing.  Give a scalar value
 to actions, much like for TAEB.)

(System for helping people regardless of their situation)

(some axioms)

(has-health-insurance ?P ?I)
(has-bank-account ?P ?B)

;; probably want to quantify the size of the support network
(has-support-network ?P)

(has-automobile ?P ?A)

(has-shelter ?P ?S)

(exists (?C)
 (and
  (has-computer ?P ?C)
  (can-run-get-help ?C)
  ))

(exists (?C)
 (and 
  (has-cell-phone ?P ?C)
  (can-run-get-help ?C)
  ))

(has-medical-condition ?P ?C)

(has-job ?P ?J)

(implies
 (not (exists (?C) (has-job ?P ?C)))
 (ought
  (or
   (has-foodstamps ?P)
   (has-unemployment-benefits ?P))))

(has-debt ?P ?D)

(has-student-loan-debt ?P ?D)
(owes-debt ?P ?E ?D)
(debt-amount ?D 1000.10)

(implies
 (and
  (has-medical-condition ?P ?C)
  (isa ?C (condition-fn mental-illness))
  (has-shelter ?P ?S)
  (located-in ?S (state-fn illinois))
  )
 (and
  (implies
   (not (exists (?J) (has-job ?P ?J)))
   (ought (use-service ?P illinois-department-of-human-services-job-placement-service)))
  ()
  ))

(has-romantic-relationship-with ?P1 ?P2)
(has-friendship-with ?P1 ?P2)

(has-sibling ?P1 ?P2)
(has-brother ?P1 ?P2)
(has-sister ?P1 ?P2)
(has-father ?P1 ?P2)
(has-mother ?P1 ?P2)

;;; more items here

(is-tracking-finances ?P)
(has-financial-records ?P ?R)

(has-need ?P 'fulfill-all-responsibilities)
(has-need ?P 'fulfill-all-promises)
(has-need ?P 'meet-all-obligations)
(has-need ?P 'pay-all-debts)

(has-usability-encumbrance ?P)

(is-legally-blind ?P)

(track the following

 (implies
  (has-permanent-residence ?X UnitedStates)
  (has-yearly-tasks taxes)))
 

;; dependants

(implies
 (has-dependant ?P1 ?P2)
 (has-moral-obligation ?P1
  (ensure-well-being-of ?P1 ?P2)))

;; psychological needs

(is-emotionally-secure ?P)		; dubious property
(is-grieving ?P)


;; philosophical needs

(has-virtue-ethic ?P ?E)
(has-deontic-ethic ?P ?E)
(has-consequentialist-ethic ?P ?E)

(has-skill ?P ?S)
(has-interest ?P ?I)
(has-goal ?P ?I)

(has-budget ?P ?B)

(has-home ?P ?H)
(has-home-office ?H ?O)

(home-is-safe ?H)
(home-has-all-carbon-monoxide-detectors ?H)

(has-fitness-plan ?P ?F)

(has-financial-plan ?P ?F)

(has-last-will-and-testament ?P ?W)


;; Mom's requirements for a good life
;; (note that these are difficult to measure)

(has-someone-to-love ?P ?P2)
(is-loved-by-others ?P)
(has-control-of-self ?P)
(has-a-sense-of-gratitude ?P)
(is-tolerant-or-considerate-of-other-entities ?P)
(does-no-harm-knowingly ?P)		; culpable ignorance
(has-enough ?P)

(has-nest-egg ?P ?N)
(has-emergency-fund ?P ?E)

;; renting, if they plan on staying, renters insurance

;; job, job-stability, etc

;; family to help out if necessary and possible

;; if has children, then plans for school, medical, etc

;; deal with conflicting advice, different goals mutex, different
;; people recommend different strategies, commentary system, etc.
;; Deontics, etc.

;; system has an agenda, weighs importance of say immediately
;; necessary tasks like food and drink against things for more
;; established people like setting up a will, etc.

;; has data backup

;; print will

;; has-office
;; has-filing-cabinet
;; filing-cabinet-is-organized

(
 is-on-top-of-finances
 is-financially-secure
 is-emotionally-secure
 is-on-top-of-laundry ;; doesn't have piles of laundry
 is-on-top-of-hygiene 

 (defrule the-mentally-ill-can-have-bad-hygiene
  (has-medical-condition ?person ?condition)
  (isa ?condition mental-illness)
  =>
  (possible (not (on-top-of-hygiene ?person))))
 )

(household-is-in-arrears ?household)
