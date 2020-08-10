;; ==================================
;; Development Setup
;; ==================================



;; (elpy-enable)				;; Enable elpy package
;; (setq python-shell-interpreter "ipython"
;;       python-shell-interpreter-args "-i") ;; set python interpreter to "ipython"

;; Enable Flycheck
;; (when (require 'flycheck nil t)
;;   (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;   (add-hook 'elpy-mode-hook 'flycheck-mode))

