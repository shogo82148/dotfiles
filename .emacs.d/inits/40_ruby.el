;;Ruby向け設定
(autoload 'ruby-mode "ruby-mode"
  "Ruby editing mode")
(add-to-list 'auto-mode-alist '("\\.rb" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "")
(autoload 'inf-ruby-keys "inf-ruby" "")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             ))
