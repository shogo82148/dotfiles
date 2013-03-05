;Javascript向け設定
(require 'js3-mode)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
(add-hook 'js3-mode-hook
          (lambda ()
            (setq js3-indent-level 4)
            (setq js3-mode-dev-mode-p t)
            (setq js3-auto-indent-p t)
            (setq js3-enter-indents-newline t)
            (setq js3-indent-on-enter-key t)
            ))
