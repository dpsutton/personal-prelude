;;; summary --- summary

;;; Commentary:

;;; Code:
;; auto complete mode on globally
(require 'auto-complete)
(require 'ac-helm)
(global-auto-complete-mode t)

;;; lisp mode settings
;; turn on lispy mode
(require 'lispy)
(add-hook 'lisp-mode-hook (lambda () (lispy-mode t)))
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
;; rainbow makes it all navigable!
(add-hook 'lisp-mode-hook (lambda () (rainbow-delimiters-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (rainbow-delimiters-mode 1)))

;; helm projectile mode
(require 'helm-projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

;; set font face
(defvar preferred-font "Menlo-11")
(set-face-attribute 'default nil :font preferred-font)
(set-frame-font preferred-font nil t)

;;; ace setting
(global-set-key (kbd "M-p") 'ace-window)

;;; tern auto complete for javascript
(require 'tern)
(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; set clisp as the lisp environment
;;(setq slime-default-lisp 'clisp)
(require 'slime)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(add-hook 'slime-mode-hook 'set-up-slime-ac)

(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

(setq inferior-lisp-program "/usr/local/bin/sbcl")
;; (setq inferior-lisp-program "clisp")

;;  off and line numbers
(setq scroll-margin 6)
(global-linum-mode t)

;;; helm mode info
(require 'helm-config)
(require 'helm-swoop)
(helm-mode 1)
;; bind helm mode to M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
;; fuzzy searches
(setq helm-M-x-fuzzy-match nil)
(setq helm-buffers-fuzzymatching nil)

;; ac stuff
(add-hook 'js2-mode-hook 'ac-j2-mode)

;; visual basic mode
;;(require 'visual-basic-mode)

;; ace window setup
(global-set-key (kbd "M-p") 'ace-window)

;;; personal.el ends here
