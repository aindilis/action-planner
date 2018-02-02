(defmodule INFORMATION-TECHNOLOGY)

;; (has-computer ?person ?computer)

;; (has-secure-offsite-backups ?computer ?backup)

;; use puppy linux on older hardware

;; is okay with, accepting of, doesn't mind -> permissible

(defrule use-puppy-linux-on-older-hardware
 (permissible use-linux)
 (has-computer ?person ?computer)
 (is-outdated ?computer)
 =>
 (tag information-technology)
 (assert (should use puppy-linux))
 )

;; (add Electric Sheep to life planner)
