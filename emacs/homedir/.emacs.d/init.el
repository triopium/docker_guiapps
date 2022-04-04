(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(horizontal-scroll-bar-mode -1)
(scroll-bar-mode -1)

(setq initial-scratch-message "") ;; Uh, I know what Scratch is for
;; (setq visible-bell t)             ;; Get rid of the beeps

(setq inhibit-splash-screen t)
;; (switch-to-buffer-other-window "*scratch*")
(add-hook 'emacs-startup-hook
          (lambda () (delete-other-windows)) t)
;; (neotree-find)

;; highlight current line for all buffers
(global-hl-line-mode 1)


;; Do not type yes or no
(fset 'yes-or-no-p 'y-or-n-p)



;; PACKAGE ARCHIVES
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
                         ("gnu"
                         . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("marmalade"
                         . "http://marmalade-repo.org/packages/")))

;; GLOBAL HOTKEYS
(global-set-key "\M-\S-k" 'shrink-window)
(global-set-key "\M-\S-j" 'enlarge-window)
(global-set-key "\M-\S-h" 'shrink-window-horizontally)
(global-set-key "\M-\S-l" 'enlarge-window-horizontally)

(global-set-key "\M-k" 'evil-window-up)
(global-set-key "\M-j" 'evil-window-down)
(global-set-key "\M-h" 'evil-window-left)
(global-set-key "\M-l" 'evil-window-right)

;; (global-set-key (kbd "M-+") 'select-window-1)
;; (global-set-key (kbd "M-ě") 'select-window-2)
;; (global-set-key (kbd "M-š") 'select-window-3)
;; (global-set-key (kbd "M-č") 'select-window-4)
;; (global-set-key (kbd "M-ř") 'select-window-5)
;; (global-set-key (kbd "M-ž") 'select-window-6)
(global-linum-mode t)

;; indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default tab-always-indent 'complete)

;; With a long history of working on small machines without gigabytes of RAM, we might as well let Emacs be the beast it has always dreamed.
;; First, let’s increase the cache before starting garbage collection:
(setq gc-cons-threshold 50000000)
;; Found here how to remove the warnings from the GnuTLS library when using HTTPS… increase the minimum prime bits size:
(setq gnutls-min-prime-bits 4096)

;; FONT
;; (set-frame-font "Inconsolata 12" nil t)
;; (add-to-list 'initial-frame-alist '(font . "Monospace-12"))
;; (set-frame-font "Ubuntu:style=Regular 12" nil t) ;; works but the font is different

;; Set default line spacing (in pixels)
(setq-default line-spacing nil)

;; When using `text-scale-incraese', this sets each 'step' to about one point size.
;; (setq text-scale-mode-step 1.08)

;; '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 98 :width normal)))))

;; initial frame
;; (add-to-list 'initial-frame-alist '(width  . 90))
;; (add-to-list 'initial-frame-alist '(height . 80))
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; (add-to-list 'initial-frame-alist '(fullscreen . fullheight))
;; (add-to-list 'initial-frame-alist '(fullscreen . fullboth))
;; default frame
;; (add-to-list 'default-frame-alist '(width  . 90))
;; (add-to-list 'default-frame-alist '(height . 40))
;; (add-to-list 'default-frame-alist '(font . "Monospace-10"))

;; (setq ns-pop-up-frames nil)

(load "~/.emacs.d/straightcfg.el")
(setq python-shell-interpreter "python3")
