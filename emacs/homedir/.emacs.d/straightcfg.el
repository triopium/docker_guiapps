(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; EVIL
(use-package evil
    :ensure t
    :defer .1
    :init
    ;; (setq evil-want-integration nil) ;; required by evil-collection
    (setq evil-want-integration nil) ;; required by evil-collection
    (setq evil-want-keybinding nil)
    (setq evil-search-module 'evil-search)
    (setq evil-ex-complete-emacs-commands t)
    (setq evil-vsplit-window-right t) ;; like vim's 'splitright'
    (setq evil-split-window-below t) ;; like vim's 'splitbelow'
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)
    (setq evil-collection-setup-minibuffer t) ;; use evil in minibuffer
    :config
    (evil-mode)
    ;; (define-key evil-normal-state-map "+" 'text-scale-increase)
    ;; (define-key evil-normal-state-map "-" 'text-scale-decrease)
    )


;; vim-like keybindings everywhere in emacs
(use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init)
    (define-key evil-normal-state-map "+" 'text-scale-increase)
    (define-key evil-normal-state-map "-" 'text-scale-decrease)
    )


;; THEMES
(use-package solarized-theme
	     :ensure t
	     :config
	     (load-theme 'solarized-dark t)
	     )

(use-package molokai-theme
	     :disabled
  :ensure t
  :load-path "themes"
  :init
  (setq molokai-theme-kit t)
  :config
  (load-theme 'molokai t)
  )

(use-package all-the-icons
						 :ensure t
						 )

;; Upon hotkey display letter inside visible buffers and the press letter to jump to that buffer
(use-package ace-window
						 :ensure t
						 :init
						 (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
						 (global-set-key (kbd "C-x o") 'ace-window)
						 :diminish ace-window-mode
						 )

;; BUFFER HEADER
;; https://www.emacswiki.org/emacs/HeaderLine
(use-package path-headerline-mode
						 :ensure t
						 :init
						 (path-headerline-mode 1)
						 )
 

;; MODELINE
(use-package powerline
						 :ensure t
						 :init
						 ;; :config
						 (setq powerline-default-separator 'curve
									 powerline-default-separator-dir (quote (left . right))
									 powerline-height 25
									 powerline-display-buffer-size t
									 powerline-display-hud nil
									 powerline-display-mule-info nil
									 powerline-gui-use-vcs-glyph t
									 powerline-inactive1 '((t (:background "grey11" :foreground "#c5c8c6")))
									 powerline-inactive2 '((t (:background "grey20" :foreground "#c5c8c6")))
									 )
						 )

						 ;; :config

;; (use-package airline-themes
						 ;; :ensure t
						 ;; :after powerline
						 ;; :config
						 ;; (load-theme 'airline-distinguished t)
						 ;; (defun powerline-evil-state ()
							 ;; "Displays *my* version of displaying the evil state."
							 ;; (case evil-state
								 ;; ('normal " N")
								 ;; ('insert " I")
								 ;; ('visual " V")
								 ;; ('motion " M")
								 ;; (t       " E")))
						 ;; )

;; (use-package spaceline
						 ;; :ensure t
						 ;; :config
						 ;; (setq spaceline-line-column-p t)
						 ;; (powerline-reset)
						 ;; )
;; (use-package spaceline
						 ;; )


;; (use-package spaceline-config
						 ;; :config
						 ;; (spaceline-define-segment line-column
							 ;; "The current line and column numbers."
							 ;; "l:%l c:%2c")
						 ;; )
;; (use-package spaceline-config
						 ;; :config
						 ;; (spaceline-define-segment line-column
							 ;; "The current line and column numbers."
							 ;; "l:%l c:%2c")
						 ;; )

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init
  (global-undo-tree-mode 1)
  :config
  (defalias 'redo 'undo-tree-redo)
  :bind
	(
	 ("C-z" . undo)     ; Zap to character isn't helpful
   ("C-S-z" . redo)
	 )
	)

;; JUMP
(use-package better-jumper
	     :ensure t
	     ;; :bind (
		    ;; ("C-l" . better-jumper-jump-backward)
		    ;; ("C-i" . better-jumper-jump-forward)
		    ;; )
	     :init
	     (setq better-jumper-context 'window)
	     ;; (setq better-jumper-context 'buffer) 
	     (setq better-jumper-max-length 100)
	     (setq better-jumper-use-evil-jump-advice t)
	     (setq better-jumper-add-jump-behavior 'append)
	     ;; (setq better-jumper-add-jump-behavior 'replace)
	     )

;; FILE MANAGER
;;;; Neotree
(use-package neotree
	     :ensure t
	     :bind (
							;; :map neotree-mode-map
							;; ("q" . neotree-hide)
		    ;; ("C-+" . text-scale-increase)
		    ;; ("C--" . text-scale-decrease)
		    )
	     :init
	     (setq neo-window-fixed-size nil)
	     (setq neo-smart-open t)
			 ;; compact
			 (setq neo-theme 'arrow)
			 ;; (setq neo-theme 'ascii)
			 ;; (setq neo-theme 'nerd)
			 ;; (setq neo-theme 'icons)
	     (global-set-key [f8] 'neotree-toggle)
			 ;;(neotree-toggle)
	     )

;; LISP
(use-package rainbow-delimiters
						 :commands (rainbow-delimiters-mode)
						 :init
						 (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
						 )


(use-package dash
  :ensure t
  :config (eval-after-load "dash" '(dash-enable-font-lock)))

(use-package s
  :ensure t)

(use-package f
  :ensure t)
