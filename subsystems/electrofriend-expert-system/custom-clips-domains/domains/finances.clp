(defmodule FINANCES)

;; (is-bankrupted ?person)

;; (has-fixed-wages ?person)
;; (is-unbanked ?person)

;; ;; capitalist definitions, probably should be avoided

;; (is-earning-rent ?person ?rent)
;; (is-earning-interest ?person ?interest)
;; (is-earning-profits ?person ?profits)
;; (owns-land ?person ?land)

;; ;; normal

;; (has-old-age-pension ?person ?pension)
;; (is-unemployed ?person)

;; (has-mortgage ?person ?shelter)
;; (is-poorly-paid ?person)

(defrule if-you-want-to-save-money-dont-eat-out
 "If you want to save money, don't eat out"
 (has-goal ?person (str-cat "(minimize-expenditure " ?person ")"))
 =>
 (tag finances)
 (has-goal ?person (str-cat "(not (is-eating-out-regularly " ?person "))")))

;; (is-frugal ?person)

(defrule move-your-money-to-a-credit-union
 "If you have have money in banks and don't agree with the politics of
large banks, consider moving your money to a credit union"
 (has-bank-account ?person)
 (is-liberal ?person)
 =>
 (tag finances)
 (has-source "https://www.commondreams.org/view/2012/04/12-5")
 (has-goal ?person (str-cat "(transfer-funds-from-bank-account-to-credit-union " ?person "))"))
 )

;; should probably add arguments to their decision support system for why to move money

