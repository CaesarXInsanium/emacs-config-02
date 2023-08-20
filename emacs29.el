(defun my-reload-emacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(setq FONT "IosevkaTerm Nerd Font")
(setq FONT_SIZE 14)
(set-face-attribute 'default nil :font FONT
				 :height (* 10 FONT_SIZE))

(defun setfont ()
  (set-face-attribute 'default nil :font FONT
     			           :height (* 10 FONT_SIZE)))
  (if (daemonp)
       (add-hook 'after-make-frame-functions
		 (lambda (frame)
		   (select-frame frame)
		   (setfont)))
     (setfont))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(electric-pair-mode t) ;; autopairs
(show-paren-mode 1) ;; show the pair of a paranthesis
(save-place-mode 1) ;; when re opening a file go back to last editing place
(setq-default indent-tabs-mode nil) ;; do not allow <Tab> key to insert Tabs
(savehist-mode t) ;; save history of commands
(recentf-mode t) ;; keep track of recently edited files
(global-auto-revert-mode t) ;; reverts file when edited

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t
      load-prefer-newer t
      backup-by-copying t
      custom-file (expand-file-name "custom.el" user-emacs-directory));; set set variables to be set in this file

(setq org-src-fontify-natively t) ;; enable syntax highlighting in source blocks in org mode

(require 'package) ;; 
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")) (package-initialize)
 (package-refresh-contents) ;; update datebase descriptions

(use-package general
  :ensure t
  :config
  (general-create-definer my-global-leader-def
    :prefix "SPC"
    :non-normal-prefix "M-SPC"))

(my-global-leader-def
         :keymaps 'normal
         ;; bind "SPC a"
         "a" 'org-agenda
         "b" 'counsel-bookmark
         "c" 'org-capture
         "k" 'describe-function
 "oe" 'org-babel-execute-src-block)
       ;; `general-create-definer' creates wrappers around `general-def', so
       ;; `evil-global-set-key'-like syntax is also supported

(use-package evil
   :ensure t
  :config
 (setq evil-search-module 'evil-search)
 (setq evil-auto-indent t)
 (setq evil-shift-width 2)
 (setq evil-shift-round t)
(setq evil-want-C-w-in-emacs-state t)
 ;(setq evil-undo-system 'undo-tree) ; what undow system to use, might require packages
 (evil-mode 1))

;; nothing
