;; C# 向け設定
(require 'csharp-mode)
(autoload 'csharp-mode "csharp-mode.el"
  "Major mode for editing C# files" t)
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))
