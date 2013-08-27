;; golang 向け設定
(require 'go-mode)
(autoload 'go-mode "go-mode.el"
  "Major mode for editing golang files" t)
(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(add-hook 'go-mode-hook
      '(lambda ()
         (setq tab-width 2) ; タブ幅を2にする
         (add-hook 'before-save-hook 'gofmt-before-save) ; 保存時に go fmt する
         ))
