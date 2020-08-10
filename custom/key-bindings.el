;; Define all the Key Bindings in here!

;; =====================================================================
;; Key Bindings
;; =====================================================================




;; magit
(global-set-key (kbd "C-. g") 'magit-status)
;; magit





;; org-mode
(require 'org)
(global-set-key "\C-cc" 'org-capture)	;org-capture hot-key
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

(setq org-capture-templates		; org-caputre template definition
      '(("j" "Journal" entry (file+datetree "~/universe/org/journal.org") "* %?\nENTRY AT: %U\n\t%i")
	("p" "Principles")
	("pw" "Work" entry (file+headline "~/universe/org/principles.org" "Work") "* %?\n")
	("pm" "Wealth" entry (file+headline "~/universe/org/principles.org" "Wealth") "* %?\n")
	("po" "Outcasts" entry (file+headline "~/universe/org/principles.org" "Outcasts") "* %?\n")
	("g" "GTD")
	("gg" "Goals" entry (file+headline "~/universe/org/goals.org" "Goals") "* TODO %?\nEntry At: %U\n\t%i")
	("gt" "Tasks" entry (file+headline "~/universe/org/gtd.org" "Tasks") "* TODO %?\n\t%i OUTCOME: \n\tNEXT_ACTION: \n")
	("gp" "Projects" entry (file+headline "~/universe/org/gtd.org" "Projects") "* TODO %?\t[[file:~/universe/org/projects/%^{Project File}.org]]  %i\n")
	("gs" "Someday" entry (file+headline "~/universe/org/gtd.org" "Someday") "* %?\n\t%i\n")
	("gc" "Calendar" entry (file+headline "~/universe/org/gtd.org" "Calendar") "* TODO %?\n\t%i\n SCHEDULED: %^t\n")
	("gk" "Tickler" entry (file+headline "~/universe/org/gtd.org" "Tickler") "* %?\n\t%i\n")
	("gr" "Reference" entry (file+headline "~/universe/org/gtd.org" "Reference") "* %?\n\t%i\n")
	("gh" "Trash" entry (file+headline "~/universe/org/gtd.org" "Trash") "* %?\n\t%i\n")
	("n" "Quick Notes" entry (file+datetree "~/universe/org/notes.org") "* %?\n\t%i\n  %a")))
;; org-mode








;; movement
(global-set-key "\M-p" 'previous-buffer)
(global-set-key "\M-n" 'next-buffer)
(global-set-key (kbd "C-. i") (lambda() (interactive) (dired "~/.emacs.d/custom"))) ;; visit init.el file in ~/.emacs.d
(global-set-key (kbd "C-. s") (lambda() (interactive) (switch-to-buffer "*scratch*"))) ;; visit *scratch* buffer
(global-set-key (kbd "C-. r") (lambda() (interactive) (switch-to-buffer (other-buffer)))) ;; vist last visited buffer
(global-set-key (kbd "C-. u") (lambda() (interactive) (dired "~/universe"))) ;; visit dired ~/universe
(global-set-key (kbd "C-;")   (lambda() (interactive) (end-of-visual-line))) ;; C-e remap
(global-set-key (kbd "C-'")   (lambda() (interactive) (beginning-of-visual-line))) ;; C-a remap
(global-set-key (kbd "C-e")   (lambda() (interactive) (eshell))) ;; switch to eshell
(global-set-key (kbd "C-a")   (lambda() (interactive) (vterm))) ;; switch to zsh
(global-set-key (kbd "C-j")   (lambda() (interactive) (next-line) (next-line) (next-line))) ;; faster line movement
(global-set-key (kbd "C-k")   (lambda() (interactive) (previous-line) (previous-line) (previous-line))) ;; faster line movement
;; movement







;; editing
(define-key global-map [(shift backspace)] 'kill-whole-line)
(global-set-key "\M-o"        (lambda() (interactive) (end-of-visual-line) (newline))) ;; Start a NewLine from anywhere
;; editing




;; elpy
;; (global-set-key "\M-p" 'elpy-goto-assignment)
;; elpy


;; projectile
(global-set-key (kbd "C-. d") 'projectile-dired)
;; projectile
