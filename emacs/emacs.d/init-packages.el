;;; PACKAGE REPOS
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)

;; (add-to-list 'package-archives
	     ;; '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/")

;; List packages to install
(setq package-list
      ;; '(solarized-theme evil use-package))
      '(solarized-theme evil))

;; activate all the packages
(package-initialize)

;; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; (eval-when-compile (require 'use-package))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;;COLORSCHEME
(load-theme 'solarized-dark t)
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)

