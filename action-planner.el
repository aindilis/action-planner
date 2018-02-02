(global-set-key "\C-crera" 'action-planner-open-rule-file)

(load "/var/lib/myfrdcsa/codebases/minor/action-planner/clips-mode.el")

(setq auto-mode-alist
 (cons '("\\.clp$" . clips-mode) auto-mode-alist))

;; have a system of opening files like radar but for grabbing the
;; relevant rule module

(defvar action-planner-rules-directories-list
 (list
  "/var/lib/myfrdcsa/codebases/minor/free-fluxplayer/attempts/1"
  "/var/lib/myfrdcsa/codebases/minor/action-planner/subsystems/electrofriend-expert-system/custom-clips-domains/domains"
  "/var/lib/myfrdcsa/codebases/minor/execution-engine/rules"
  "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/minor/action-planner/flora2"
  "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/minor/action-planner/subsystems/temporal-logic/rules"
  ;; "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/minor/android"
  "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/minor/data-manager/siphon"
  "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/minor/inventory-manager"
  "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/minor/media-library/data-git"
  "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/minor/rayon/flora2"
  "/var/lib/myfrdcsas/versions/myfrdcsa-1.0/codebases/releases/verber-0.2/verber-0.2/data-git/worldmodel/flora-2"
  "/var/lib/myfrdcsa/codebases/minor/cause-effect/rules"
  "/var/lib/myfrdcsa/codebases/internal/verber/data/worldmodel"
  ))

;; (defun action-planner-open-rule-file (arg &optional initial-input)
;;  "Jump to an action planner module"
;;  (interactive "P")
;;  (if arg
;;   (ffap "/var/lib/myfrdcsa/codebases/minor/action-planner/rules.flr")
;;   (ffap
;;    (radar-select-directory
;;     (kmax-grep-list-regexp (kmax-get-all-subdirectories-of-directories-in-list action-planner-rules-directories-list) "/barcode/")
;;     initial-input))))

(defun action-planner-open-rule-file (arg &optional initial-input)
 "Jump to an action planner module"
 (interactive "P")
 (if arg
  (ffap "/var/lib/myfrdcsa/codebases/minor/action-planner/rules.flr")
  (ffap
   (radar-select-directory 
    ;; action-planner-rules-directories-list
    ;; (kmax-list-all-absolute-subdirectories-of-directories-no-hidden action-planner-rules-directories-list)
    (kmax-get-all-subdirectories-of-directories-in-list action-planner-rules-directories-list)
    initial-input))))

;; provide tools for annotating text in the library for rules and the like

;; (kmax-find-name-dired "/var/lib/myfrdcsa/codebases/minor/execution-engine/rules" ".")

(defun action-planner-annotate-term ()
 "Take the region and annotate as a term"
 (interactive)
 
 )
