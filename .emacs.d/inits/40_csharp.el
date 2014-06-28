;; C# 向け設定
(require 'csharp-mode)
(autoload 'csharp-mode "csharp-mode.el"
  "Major mode for editing C# files" t)
(add-to-list 'auto-mode-alist '("\\.cs$" . csharp-mode))

;; インデントはタブのみ、4文字幅
(add-hook 'csharp-mode-hook
          (lambda ()
            (setq default-tab-width 4)
            (setq indent-tabs-mode t)
	    (c-set-offset 'substatement-open 0)
	    (c-set-offset 'case-label '+)
	    (c-set-offset 'arglist-intro '+)
	    (c-set-offset 'arglist-close 0)
            ))
