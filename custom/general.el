;; ===================================
;; Basic Customization
;; ===================================

(setq user-full-name "Madhu Surisetti"
      user-mail-address "flyabovetheclouds.rf@gmail.com")

(setq gc-cons-threshold 50000000)	      ;; garbage collection threshold
(setq large-file-warning-threshold 100000000) ;; file size warning threshold

;; (setq inhibit-startup-message t)    ;; Hide the startup message
(load-theme 'material t)            ;; Load material theme
(global-linum-mode t)               ;; Enable line numbers globally
(global-hl-line-mode +1)
(setq default-frame-alist '((font . "Source Code Pro-19"))) ;; set font size to 19
(setq next-line-add-newlines t)				    ;; C-n adds new lines
;; (setq ido-enable-flex-matching t)			    ;; ido-mode
;; (setq ido-everywhere t)					    ;; ido-mode
;; (ido-mode 1)						    ;; ido-mode
(toggle-frame-fullscreen)		;; Start Emacs in FullScreen
(column-number-mode t)			;; shows column number on modeline
(size-indication-mode t)		;; shows file size on modeline
;; (use-package doom-themes		;; a theme
;;   :ensure t
;;   :config
;;   (load-theme 'doom-one t)
;;   (doom-themes-visual-bell-config))

(use-package smart-mode-line-powerline-theme ;; a modeline package
  :ensure t)

(use-package smart-mode-line		;; a modeline package
  :ensure t
  :config
  (setq sml/theme 'powerline)
  (add-hook 'after-init-hook 'sml/setup))

;; Emacs likes to strew its backup and temporary files everywhere. Lets give them a home in the temporary file directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(fset 'yes-or-no-p 'y-or-n-p)		;; yes-or-no to y-or-n

(global-auto-revert-mode t)		;; Emacs to reload the file automatically when edited outside

(global-set-key (kbd "C-x k") 'kill-this-buffer) ;; I’d rather Emacs kill the current buffer I am in without verifying

(setq-default tab-width 4
              indent-tabs-mode nil)
