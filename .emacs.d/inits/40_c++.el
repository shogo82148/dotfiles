
;C言語のインデントを4桁に
(setq-default c-basic-offset 4)

(add-hook 'c-mode-hook
          (lambda ()
            (c-set-style "cc-mode")
            (setq-default indent-tabs-mode nil) ; インデントにタブを使用しない
            ))
(add-hook 'c++-mode-hook
          (lambda ()
            (c-set-style "cc-mode")
            (setq-default indent-tabs-mode nil) ; インデントにタブを使用しない
            ))
