;; THE INIT FILE

(setq python-shell-interpreter "/usr/local/bin/python3")

;; for SLIME
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
