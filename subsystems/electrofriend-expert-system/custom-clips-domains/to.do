(we want to have a move generator, that takes a look at a
 situation and makes recommendations for moves.  this will
 naturally include non-expert system reasoning, and so will have
 to be larger and use external reasoners.  Perhaps should use
 semantic web rule language or something similar, use Jess,
 although Jess is non open source, perhaps try Jena?)

(secondly, we want a system for comparing pairwise two actions
 wrt a situation to determine which is more important and why.
 We want to have a matrix or something that explains what happens
 if a goal is unmet, and how that affects things)

(Have a friendship evaluator that determines the strength of the
 friendship?)




(defrule continuity-of-life
 (is-alive ?person)
 (not (is-dying ?person))
 =>
 (has-need ?person basic-subsistence food)
 (has-need ?person basic-subsistence water)
 )

(defrule basic-sanitation
 (is-alive ?person)
 (not (is-dying ?person))
 (desires-survival-level ?person basic-sanitation)
 =>
 (has-need ?person basic-sanitation sanitation)
 )

;; (provides-need ?item ?need)