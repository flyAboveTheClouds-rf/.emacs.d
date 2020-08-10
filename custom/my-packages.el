;; All your packages listed here!
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
;; (defvar myPackages
;;   '(better-defaults                 ;; Set up some better Emacs defaults
;;     ;; elpy			    ;; Emacs Lisp Python Environment
;;     ;; flycheck			    ;; On the fly Syntax Check
;;     use-package         ;; sane package declaration
;;     magit			    ;; Git Integration
;;     helm
;;     projectile
;;     helm-projectile
;;     ;; smart-parens
;;     which-key
;;     avy
;;     )
;;   )



;; ;; Scans the list in myPackages
;; ;; If the package listed is not already installed, install it
;; (mapc #'(lambda (package)
;;           (unless (package-installed-p package)
;;             (package-install package)))
;;       myPackages)

;; ======================================================================
;; Development Setup
;; ======================================================================

(use-package elpy
  :ensure t
  :init
  (elpy-enable))















;; ======================================================================
;; Project Setup
;; ======================================================================

(use-package helm
  :ensure t
  :defer 2
  :bind
  ("M-x" . helm-M-x)
  ("C-x C-f" . helm-find-files)
  ("M-y" . helm-show-kill-ring)
  ("C-x b" . helm-mini)
  :config
  (require 'helm-config)
  (helm-mode 1)
  (setq helm-split-window-inside-p t
    helm-move-to-line-cycle-in-source t)
  (setq helm-autoresize-max-height 0)
  (setq helm-autoresize-min-height 20)
  (helm-autoresize-mode 1)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  )

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :bind
  (("C-. f" . helm-projectile-find-file)
   ("C-. p" . helm-projectile-switch-project)
   ("C-. e" . projectile-save-project-buffers))
  :config
  (projectile-mode +1)
)

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))













;; ===========================================================
;; Convenience Packages
;; ===========================================================

(use-package smartparens                ;; a package for dealing with paranthesis
  :ensure t
  :diminish smartparens-mode
  :config
  (progn
    (require 'smartparens-config)
    (smartparens-global-mode 1)
    (show-paren-mode t)))



(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode +1))



(use-package avy
  :ensure t
  :bind
  ("C-," . avy-goto-char)
  :config
  (setq avy-background t))


(use-package highlight-defined
  :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook #'highlight-defined-mode)
  )


(use-package web-mode
  :ensure t
  :diminish "🌎"
  :mode 
  (("\\.phtml\\'" . web-mode)
  ("\\.tpl\\.php\\'" . web-mode)      
  ("\\.jsp\\'" . web-mode)            
  ("\\.as[cp]x\\'" . web-mode)        
  ("\\.erb\\'" . web-mode)            
  ("\\.mustache\\'" . web-mode)       
  ("\\.djhtml\\'" . web-mode)         
  ("\\.jst.ejs\\'" . web-mode)        
  ("\\.html?\\'" . web-mode))
  :init
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-comment-keywords t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)   
  (setq web-mode-script-padding 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-comment-style 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2))



;; (use-package speed-type
;;   :ensure t
;;   :init
;;   (add-to-list 'load-path "~/.emacs.d/speed-type/speed-type.el"))

(use-package company
  :ensure t
  :diminish company-mode
  :config
  (add-hook 'after-init-hook #'global-company-mode))


(use-package diminish
  :ensure t)

;; (use-package flycheck
;;   :ensure t
;;   :diminish flycheck-mode
;;   :config
;;   (add-hook 'after-init-hook #'global-flycheck-mode))





;; (use-package yasnippet                  ; Snippets
;;   :ensure t
;;   :config
;;   (validate-setq
;;    yas-verbosity 1                      ; No need to be so verbose
;;    yas-wrap-around-region t)

;;   (with-eval-after-load 'yasnippet
;;     (validate-setq yas-snippet-dirs '(yasnippet-snippets-dir)))

;;   (yas-reload-all)
;;   (yas-global-mode))

;; (use-package yasnippet-snippets         ; Collection of snippets
;;   :ensure t)


(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :config
  (add-to-list 'yas-snippet-dirs (locate-user-emacs-file "snippets")))
