;Javascript向け設定
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
          '(lambda ()
             (setq-default indent-tabs-mode nil
			   js-indent-level 4
			   ) ; インデントにタブを使用しない
	     ))

;; 外部で定義されているはずの変数・関数の警告抑制
(setq js2-global-externs
      (list "require" "describe" "it" "expect" "$" "location" "process" "module"))
