; Common preparations

; Common preparations sometimes include preparing a clandestine or
; defensible "retreat" or "safe place" (Bug Out Location or BOL) and
; stockpiling non-perishable food, water, water-purification equipment,
; clothing, seed, firewood, defensive/hunting weapons, ammunition, and
; agricultural equipment. Some survivalists do not make such extensive
; preparations but instead merely incorporate a "Be Prepared" outlook
; into their everyday life.  Many survivalists also have a bag of gear
; that is often referred to as a Bug Out Bag (BOB) or Get Out Of
; Dodge (G.O.O.D.) kit,[45] holding basic necessities and useful items
; weighing anywhere up to as much as the owner can carry.  Others
; assemble what is commonly called a "72-hour kit". In most community
; emergency situations, it will take at least three days (72 hours) for
; outside the community help to arrive. Therefore, there should be three
; days worth of food, water, and personal items for each member of the
; family. The 72-hour survival kit also includes first aid kit, small
; toys, important numbers and papers, as well as a plan for outside of
; the community contact and meeting location. There are also 72-hour
; isolation kits that include using a 5-gallon bucket as a toilet,
; tablets for water purification, and hygiene issues.  The most ardent
; survivalists aim to remain self-sufficient for the duration of the
; breakdown of social order, or perhaps indefinitely if the breakdown is
; predicted to be permanent (a "Third Dark Age"), a possibility
; popularized in the 1960s by Roberto Vacca of the Club of Rome. Some
; survivalists allow for the contingency that they cannot prevent this
; breakdown, and prepare to survive in small communal groups ("group
; retreats") or "covenant communities".

; (has-safe-place-or-retreat ?person ?place)
; (has-non-perishable-food-stockpile ?person ?stockpile)
; (has-water-stockpile ?person ?stockpile)
; (has-water-purification-equipment ?person ?equipment)
; (has-seed-stockpile ?person ?stockpile)
; (has-firewood-stockpile ?person ?stockpile)
; (has-weapon ?person ?weapon)
; (has-ammunition ?person ?weapon ?ammunition)
; (is-trained-with-weapon ?person ?weapon)
; (has-agricultural-equipment ?person ?equipment)
; (has-be-prepared-outlook ?person)
; (has-bug-out-bag ?person)
; (has-72-hour-kit ?person)
; (has-item ?72-hour-kit food)
; (has-item ?72-hour-kit water)
; (has-item ?72-hour-kit first-aid-kit)
; (has-item ?72-hour-kit important-numbers-and-papers)
; (has-item ?72-hour-kit meeting-plan)
; (has-item ?advanced-72-hour-kit 5-gallon-bucket)
; (has-item ?advanced-72-hour-kit water-purification-tablet)
; (has-item ?advanced-72-hour-kit hygiene-issues)

(defrule safe-place
 (has-facet ?person Survivalist)
 =>
 
 )