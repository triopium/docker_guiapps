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

(use-package evil
    :ensure t
    :defer .1
    :init
    (setq evil-want-integration nil) ;; required by evil-collection
    (setq evil-want-keybinding nil)
    (setq evil-search-module 'evil-search)
    (setq evil-ex-complete-emacs-commands nil)
    (setq evil-vsplit-window-right t) ;; like vim's 'splitright'
    (setq evil-split-window-below t) ;; like vim's 'splitbelow'
    (setq evil-shift-round nil)
    (setq evil-want-C-u-scroll t)
    :config
    (evil-mode)
    )


  ;; vim-like keybindings everywhere in emacs
(use-package evil-collection
    :after evil
    :ensure t
    :config
    (evil-collection-init)
    )


(use-package solarized-dark
	     :ensure t
	     )
