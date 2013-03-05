; Settings for Kuin
; http://dl.dropbox.com/u/9975638/kuin/emacs/index.html
(require 'js3-mode)
(autoload 'kuin-mode "kuin-mode" nil t)
(add-hook 'kuin-mode-hook '(lambda () (font-lock-mode 1)))
(setq auto-mode-alist
      (cons (cons "\\.kn$" 'kuin-mode) auto-mode-alist))
