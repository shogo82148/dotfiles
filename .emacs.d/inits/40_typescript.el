;; typescript向け設定

;;(require 'typescript-mode)
(autoload 'typescript-mode "typescript-mode" nil t)
(add-to-list 'auto-mode-alist '("\.ts$" . typescript-mode))

(require 'tss)
(tss-config-default)
