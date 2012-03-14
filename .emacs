(setq load-path
      (append
       (list
       (expand-file-name "~/.elisp/")
       )
       load-path))(setq-default c-basic-offset 4)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

