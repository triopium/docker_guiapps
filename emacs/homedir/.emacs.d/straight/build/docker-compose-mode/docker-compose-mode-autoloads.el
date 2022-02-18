;;; docker-compose-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "docker-compose-mode" "docker-compose-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from docker-compose-mode.el

(autoload 'docker-compose-mode "docker-compose-mode" "\
Major mode to edit docker-compose files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("docker-compose[^/]*\\.ya?ml\\'" . docker-compose-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "docker-compose-mode" '("docker-compose-")))

;;;***

(provide 'docker-compose-mode-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; docker-compose-mode-autoloads.el ends here
