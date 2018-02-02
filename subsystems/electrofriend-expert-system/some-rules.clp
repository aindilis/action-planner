(defrule no-cans-in-the-trash 
 "There should be no cans in the trash, they should be rinsed and put in the recyle, so that we don't have to pay for them twice."
 =>
 )

(defrule hygiene
 "for hygiene"
 (is-man ?person)
 (age ?person ?age)
 (test (> ?age 15))
 =>
 ;; (should-have-goal (str-cat "()
 ;; "if they want good hygiene, they should be shaved"
 )

(defrule rent-must-be-paid
 "If a person is renting and owes rent, it should be paid, a special case of pay debts, however, this debt can not be put off"
 =>
 )

;; if you don't pay rent, you get kicked out of your apartment


;; "If a person has a serious medical problem that hasn't been treated, and have insurance, they should see a doctor, or read how to treat it"
;; "If a person has a serious medical problem that hasn't been treated, and have insurance, they should see a doctor, or read how to treat it"

;; "If your teeth hurt, and you have floss and a tooth brush, use them to keep them clean"

;; "If brushing teeth does not remove pain, see a dentist"

;; "a responsibility becomes a problem if it is not taken care of"

;; "take care of little problems so they don't become big problems"

;; define a hierarchy of little versus big problems

;; little-problems
;; bad-body-odor

(deffacts little-problems
 (little-problem bad-body-odor)
 (little-problem-could-become-big-problem bad-body-odor social-issue)
 (little-problem-could-maybe-become-big-problem bad-body-odor health-issue)

 (category-of-little-problem hygiene)
 (category-of-little-problem housekeeping)
 (category-of-little-problem finances)
 (category-of-little-problem mental-attitude)
 (category-of-little-problem psychology)
 (category-of-little-problem food)
 (category-of-little-problem exercise)

 )


(has-exercise-plan ?person ?plan)

;; if you have student debt, and have a budget that allows, pay it off
;; have to look at what happens if you don't

;; if you have a facility, and you are security-conscious, you may
;; wish to get security cameras to watch it

;; if you're dying, call 911

;; if you are a female senior citizen, and are not allergic to aspirin, consider carrying an aspirin with you at all times for stroke medication
;; explanation "Article in AARP"
;; source "Joy Behnar"
;; author "Ellie Dougherty"

;; It would be a good idea to grow your own food, because of rising food prices, the pesticide problem, transporation of remote foods, be more sure of the food