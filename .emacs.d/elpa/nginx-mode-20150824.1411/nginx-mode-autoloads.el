;;; nginx-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "nginx-mode" "nginx-mode.el" (22231 57252 0
;;;;;;  0))
;;; Generated autoloads from nginx-mode.el

(autoload 'nginx-mode "nginx-mode" "\
Major mode for highlighting nginx config files.

The variable nginx-indent-level controls the amount of indentation.
\\{nginx-mode-map}

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("nginx\\.conf\\'" . nginx-mode))

(add-to-list 'auto-mode-alist '("/nginx/.+\\.conf\\'" . nginx-mode))

;;;***

;;;### (autoloads nil nil ("nginx-mode-pkg.el") (22231 57252 487162
;;;;;;  0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; nginx-mode-autoloads.el ends here
