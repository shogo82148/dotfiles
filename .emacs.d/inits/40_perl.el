(defalias 'perl-mode 'cperl-mode)
(setq auto-mode-alist (cons '("\\.t$" . cperl-mode) auto-mode-alist))
(add-hook 'cperl-mode-hook
          '(lambda ()
                  (cperl-set-style "PerlStyle"))) (cperl-set-style "PerlStyle")


