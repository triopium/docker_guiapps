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

;; GLOBAL HOTKEYS

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
	     ;; :bind (
		    ;; ("C-+" . text-scale-increase)
		    ;; ("C--" . text-scale-decrease)
		    ;; )
	     :init
	     (setq neo-window-fixed-size nil)
	     (setq neo-smart-open t)
	     (global-set-key [f8] 'neotree-toggle)
	     )

;; (global-set-key (kbd "C-+") 'text-scale-decrease)
;; (global-set-key (kbd "C--") 'text-scale-increase)
;; (global-set-key "+" 'text-scale-increase)
;; (global-set-key "-" 'text-scale-decrease)
