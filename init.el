;; ===================================
;; MELPA Package Support
;; ===================================
;; Enables basic packaging support
(require 'package)

;; Adds the Melpa archive to the list of available repositories
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; Initializes the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Installs packages
;;
;; myPackages contains a list of package names
(defvar myPackages
  '(better-defaults                 ;; Set up some better Emacs defaults
    elpy			    ;; Emacs Lisp Python Environment
    flycheck			    ;; On the fly Syntax Check
    magit			    ;; Git Integration
    material-theme                  ;; Theme
    projectile			    ;; Project Management
    helm
    helm-projectile
    company				;; Autocompletion
    )
  )

;; Scans the list in myPackages
;; If the package listed is not already installed, install it
(mapc #'(lambda (package)
          (unless (package-installed-p package)
            (package-install package)))
      myPackages)




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
(global-set-key (kbd "C-. i") (lambda() (interactive) (find-file "~/.emacs.d/init.el"))) ;; visit init.el file in ~/.emacs.d
(global-set-key (kbd "C-. s") (lambda() (interactive) (switch-to-buffer "*scratch*"))) ;; visit *scratch* buffer
(global-set-key (kbd "C-. r") (lambda() (interactive) (switch-to-buffer (other-buffer)))) ;; vist last visited buffer
(global-set-key (kbd "C-. u") (lambda() (interactive) (dired "~/universe"))) ;; visit dired ~/universe
(global-set-key (kbd "C-;")   (lambda() (interactive) (end-of-visual-line))) ;; C-e remap
(global-set-key (kbd "C-'")   (lambda() (interactive) (beginning-of-visual-line))) ;; C-a remap
(global-set-key (kbd "C-e")   (lambda() (interactive) (eshell))) ;; switch to eshell
(global-set-key (kbd "C-a")   (lambda() (interactive) (shell))) ;; switch to eshell
;; movement

;; editing
(define-key global-map [(shift backspace)] 'kill-whole-line)
(global-set-key "\M-o"        (lambda() (interactive) (end-of-visual-line) (newline))) ;; Start a NewLine from anywhere
;; editing


;; ======================================================================
;; Project Setup
;; ======================================================================

(helm-mode 1)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(projectile-mode 1)
;; (global-set-key (kbd "C-. f") 'helm-projectile-find-file)
(global-set-key (kbd "C-. f") (lambda() (interactive) (helm-projectile-find-file))) ;; visit dired ~/universe
;; (define-key helm-map (kbd "C-. f") 'helm-projectile-find-file) ; rebind tab to run persistent action



;; (use-package projectile
;;   :ensure t
;;   :diminish projectile-mode
;;   :bind
;;   (("C-c p f" . helm-projectile-find-file)
;;    ("C-c p p" . helm-projectile-switch-project)
;;    ("C-c p s" . projectile-save-project-buffers))
;;   :config
;;   (projectile-mode +1)
;; )

;; (use-package helm
;;   :ensure t
;;   :defer 2
;;   :bind
;;   ("M-x" . helm-M-x)
;;   ("C-x C-f" . helm-find-files)
;;   ("M-y" . helm-show-kill-ring)
;;   ("C-x b" . helm-mini)
;;   :config
;;   (require 'helm-config)
;;   (helm-mode 1)
;;   (setq helm-split-window-inside-p t
;;     helm-move-to-line-cycle-in-source t)
;;   (setq helm-autoresize-max-height 0)
;;   (setq helm-autoresize-min-height 20)
;;   (helm-autoresize-mode 1)
;;   (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
;;   (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
;;   (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
;;   )






;; ===================================
;; Basic Customization
;; ===================================

;; (setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(setq default-frame-alist '((font . "Source Code Pro-19"))) ;; set font size to 19
(setq next-line-add-newlines t)				    ;; C-n adds new lines
;; (setq ido-enable-flex-matching t)			    ;; ido-mode
;; (setq ido-everywhere t)					    ;; ido-mode
;; (ido-mode 1)						    ;; ido-mode
(toggle-frame-fullscreen)		;; Start Emacs in FullScreen






;; ==================================
;; Development Setup
;; ==================================
(elpy-enable)				;; Enable elpy package
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i") ;; set python interpreter to "ipython"

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))






;; User-Defined init.el ends here






(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/universe/org")))
 '(package-selected-packages
   (quote
    (projectile material-theme magit flycheck elpy better-defaults)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
