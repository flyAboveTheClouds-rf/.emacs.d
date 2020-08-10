; ~/.emacs


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'after-init-hook '(lambda ()
                              (load "~/.emacs.d/custom/my-packages.el")
                              (load "~/.emacs.d/custom/dev.el")
                              (load "~/.emacs.d/custom/general.el")
                              (load "~/.emacs.d/custom/disable-externals.el")
                              (load "~/.emacs.d/init.el")
                              (load "~/.emacs.d/custom/key-bindings.el")))  ; Load your key-bindings file at the end - To prevent override
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-start-on-flymake-mode nil)
 '(org-agenda-files (quote ("~/universe/org/" "~/universe/org/projects/")))
 '(package-selected-packages
   (quote
    (sly neotree vterm react-snippets yasnippet-snippets diminish elpy material-theme fireplace spray speed-type symon web-mode highlight-defined smart-mode-line-powerline-theme doom-themes smartparens avy which-key smart-parens helm-projectile projectile helm magit use-package better-defaults)))
 '(shell-file-name "/bin/bash")
 '(tool-bar-mode nil)
 '(vterm-shell "/bin/zsh")
 '(word-wrap t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-defined-function-name-face ((t (:inherit font-lock-function-name-face :box (:line-width 2 :color "gold" :style released-button)))))
 '(highlight-defined-variable-name-face ((t (:inherit font-lock-variable-name-face :box (:line-width 2 :color "blue" :style released-button))))))
(put 'erase-buffer 'disabled nil)
