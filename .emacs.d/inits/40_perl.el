(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook
          '(lambda ()
             (cperl-set-style "PerlStyle")
             (setq-default indent-tabs-mode nil) ; インデントにタブを使用しない
             (setq cperl-indent-level 4
                   cperl-close-paren-offset -4
                   cperl-continued-statement-offset 4
                   cperl-indent-parens-as-block t
                   cperl-tab-always-indent t)
))



