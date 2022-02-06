;; (use-package example
;; :ensure t ;; instal package when missin
;; :init ;; before init
;; :commands
;; :custom ;; package customization variables
;; :config ;; evalued after package is loaded
;; :bind
;; :diminish ;; do not display mode in modeline
;; )

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
		(define-key evil-normal-state-map "ů" 'comment-line)
		;; Make evil-mode up/down operate in screen lines instead of logical lines
		(define-key evil-motion-state-map "j" 'evil-next-visual-line)
		(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
		;; Also in visual mode
		(define-key evil-visual-state-map "j" 'evil-next-visual-line)
		(define-key evil-visual-state-map "k" 'evil-previous-visual-line)

    )

;; EVIL MOTION
(use-package avy
						 :ensure t
						 :config
						 (avy-setup-default)
						 ;; (global-set-key (kbd "<leader> j") "avy-goto-line")
						 )

(use-package smooth-scrolling
						 :ensure t
						 :init
						 )
(smooth-scrolling-mode)

(use-package evil-leader
  :commands (evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init (global-evil-leader-mode)
  :config
	;; (avy-setup-default)
	;; (global-set-key (kbd "C-c C-j") 'avy-resume)
	(setq
	 lazy-highlight-cleanup nil ;; cleanup of isearch marks
	 )
	
	(progn
    (evil-leader/set-leader "<SPC>")
		(evil-leader/set-key
		"<SPC>e" 'find-file
		"<SPC>k" 'kill-buffer
		"<SPC>Z" 'toggle-frame-fullscreen
		"<SPC>l" 'buffer-menu
		"j" 'evil-avy-goto-line
		"k" 'avy-goto-word-0
		"s" 'avy-isearch
		"r" 'avy-resume
		;; "f" 'evil-avy-goto-char-2
		;; "j" 'evil-avy-goto-char
		;; "x" 'shell-toggle
		;; "w" 'ewmctrl
		)
		)
	)


;; (use-package evil-easymotion
						 ;; :ensure t
						 ;; :config
						 ;; (evilem-default-keybindings "SPC")
						 ;; )


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
						 :init
						 (setq inhibit-compacting-font-caches t) ;; if slow rendering
						 ;; (all-the-icons-install-fonts)
						 ;; (all-the-icons-icon-for-buffer)
						 ;; (all-the-icons-icon-for-dir)
						 ;; (all-the-icons-icon-for-file)
						 ;; (all-the-icons-icon-for-mode)
						 ;; (all-the-icons-icon-for-url)
						 )

;; Upon hotkey display letter inside visible buffers and the press letter to jump to that buffer
(use-package ace-window
						 :ensure t
						 :init
						 (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
						 ;; (global-set-key (kbd "C-x o") 'ace-window)
						 (global-set-key (kbd "M-o") 'ace-window)
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
;; (setq-default mode-line-format
							;; (list
							;; "hello"
							;; ((:eval ((buffer-modified-p))))
							 ;; )
							;; )
           ;; (getenv "USER")))

(use-package powerline
						 :config
						 (setq powerline-height 28
							;; powerline-display-buffer-size t
							)
						 ;; (powerline-center-evil-theme)
						 ;; (load-theme 'powerline-evil-center-color-theme t)
						 )


(use-package airline-themes
						 :ensure t
						 :after powerline
						 :config
						 (load-theme 'airline-distinguished t)
						 (setq powerline-default-separator 'utf-8)
						 (setq powerline-utf-8-separator-left  #xe0b0
									 powerline-utf-8-separator-right #xe0b2)
						 )

;; (add-hook 'after-init-hook 'powerline-reset)

;; (use-package powerline-evil)
;; (use-package evil-matchit
						 ;; :diminish t
						 ;; :init (global-evil-matchit-mode 1))

;; (use-package powerline
						 ;; :ensure t
						 ;; :init
						 ;; :config
						 ;; (setq powerline-default-separator 'curve
									 ;; powerline-default-separator-dir (quote (left . right))
									 ;; powerline-height 25
									 ;; powerline-display-buffer-size t
									 ;; powerline-display-hud nil
									 ;; powerline-display-mule-info nil
									 ;; powerline-gui-use-vcs-glyph t
									 ;; powerline-inactive1 '((t (:background "grey11" :foreground "#c5c8c6")))
									 ;; powerline-inactive2 '((t (:background "grey20" :foreground "#c5c8c6")))
									 ;; )
						 ;; )

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

;; SEARCHING
;;;; IDO
;; https://www.masteringemacs.org/article/introduction-to-ido-mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-use-filename-at-point 'guess)
(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))
(ido-mode)

;; FILE MANAGER
;;;; Neotree
;;;; ALTERNATIVE: treemacs
(use-package neotree
	;; (defun my-project-hook () (neotree-find))
	;; (add-hook 'find-file-hook 'my-project-hook)
	:ensure t
	:bind (
				 ;; :map neotree-mode-map
				 ;; ("q" . neotree-hide)
		     ;; ("C-+" . text-scale-increase)
		     ;; ("C--" . text-scale-decrease)
		     )
	:init
	;; (neotree-mode t)
	(setq neo-window-fixed-size nil)
	(setq neo-smart-open t)
	(setq neo-autorefresh t) 
	;; compact
	(setq neo-theme 'arrow)
	(setq neo-window-width 10)
	;; (setq neo-theme 'ascii)
	;; (setq neo-theme 'nerd)
	;; (setq neo-theme 'icons)
	(global-set-key [f8] 'neotree-toggle)
	:config
	(evil-set-initial-state 'neotree-mode 'normal)
	(evil-define-key 'normal neotree-mode-map
	  (kbd "r") 'neotree-refresh
    (kbd "H") 'neotree-hidden-file-toggle
    (kbd "R") 'neotree-rename-node
    (kbd "D") 'neotree-delete-node
    (kbd "C") 'neotree-change-root
    (kbd "q") 'neotree-hide
      ;; (kbd "RET") 'neotree-enter
      ;; (kbd "c")   'neotree-create-node
      ;; (kbd "j")   'neotree-next-node
      ;; (kbd "k")   'neotree-previous-node
      ;; (kbd "l")   'neotree-enter
    )
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

;; (use-package s
  ;; :ensure t)

;; (use-package f
	;; :ensure t)

;; KEYBINDING HELPER
;; https://lupan.pl/dotemacs/
(use-package which-key
  :ensure t
	:init
	(which-key-mode 1)
  :config
	(which-key-setup-side-window-right-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 2
        which-key-show-early-on-C-h t
        which-key-idle-secondary-delay 0.05)
	:diminish
	which-key-mode
	)

(global-set-key (kbd "C-c h b") 'describe-personal-keybindings)
(use-package remind-bindings
  :bind ("H-?" . remind-bindings-togglebuffer))

;; LANGUAGES
;; Display possible completions at all places
(use-package ido-completing-read+
  :ensure t
  :config
  ;; This enables ido in all contexts where it could be useful, not just
  ;; for selecting buffer and file names
  (ido-mode t)
  (ido-everywhere t)
  ;; This allows partial matches, e.g. "uzh" will match "Ustad Zakir Hussain"
  (setq ido-enable-flex-matching t)
  (setq ido-use-filename-at-point nil)
  ;; Includes buffer names of recently opened files, even if they're not open now.
  (setq ido-use-virtual-buffers t)
  :diminish nil)

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :config (progn
          ;; use flycheck, not flymake
						(setq lsp-prefer-flymake nil))
	(define-key lsp-mode-map (kbd "M-RET") 'lsp-find-references)
	(define-key lsp-mode-map (kbd "RET") 'lsp-list-errors)
	)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
  ;; reformat Go code and add missing (or remove old) imports
  ;; :hook ((before-save . my-lsp-format-buffer)
         ;; (before-save . my-lsp-organize-imports))
  ;; uncomment to enable gopls http debug server
;; :custom (lsp-gopls-server-args '("-debug" "127.0.0.1:0"))

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-enable nil
        lsp-ui-sideline-delay 5.0)
  :bind (("C-c d" . lsp-ui-doc-show)
         ("C-c i" . lsp-ui-imenu)))

;; (use-package company
;; 	:ensure t
;;   :bind (:map company-active-map
;;          ("C-n" . company-select-next)
;;          ("C-p" . company-select-previous))
;;   :config
;;   (setq company-idle-delay 0.3)
;; 	(setq company-dabbrev-downcase n)
;;   (global-company-mode t))

;;(use-package company-lsp
;;	 :ensure t
;;   :init
;;	 :commands
;;	 :bind
;;	 )

(use-package company-lsp
	 :ensure t
   :init
	 :config
	 ;; (evil-collection-company-use-tng  nil)
	 ;; :commands
	 :bind
	 )

(use-package treemacs
;; tree layout file explorer for emacs
	:ensure t
	)

(use-package lsp-origami
	 :ensure t
   :init
	 ;; :commands
	 :bind
	 )

;;;; GOLANG
(use-package go-mode
	 :ensure t
   :init
	 (add-hook 'go-mode-hook 'lsp-deferred)
	 (setq gofmt-command "goimports")
	 (add-hook 'before-save-hook 'gofmt-before-save)
	 ;; :commands
	 :bind
	 ;; TODO: bind to enter only in gomode
	 ;; ("<return>" . godef-jump)
	 )

;; (use-package go-mode
	 ;; :ensure t
   ;; :demand t)

;; (use-package go-guru
	;; :ensure t
  ;; :demand t)

;; (use-package go-rename
	;; :ensure t
  ;; :demand t)

;;;; HTML

;; EMACS PROFILING
(use-package esup
  :ensure t
  ;; To use MELPA Stable use ":pin melpa-stable",
  :pin melpa)

;;; run after load
;; (defun my-project-hook () (neotree-find))
;; (add-hook 'find-file-hook 'my-project-hook)
(neotree-show)
;; (neotree-find)

;;;; REST
(use-package restclient
	 :ensure t
   :init
	 )

(use-package company-restclient
	 :ensure t
   :init
	 )

;; (find-file "~/Gopd/uploader/src/uploader/httpserver/router.go")

