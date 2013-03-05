(setq load-path
      (append
       (list
        (expand-file-name "~/.emacs.d/elisp/"))
       load-path))

;; init-loader
;; http://coderepos.org/share/browser/lang/elisp/init-loader/init-loader.el
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

(setq load-path
      (append
       (list
       (expand-file-name "~/.elisp/")
       )
       load-path))
(add-to-list 'exec-path "/usr/local/bin")


; Settings for Kuin
; http://dl.dropbox.com/u/9975638/kuin/emacs/index.html
(autoload 'kuin-mode "kuin-mode" nil t)
(add-hook 'kuin-mode-hook '(lambda () (font-lock-mode 1)))
(setq auto-mode-alist
      (cons (cons "\\.kn$" 'kuin-mode) auto-mode-alist))


(autoload 'twittering-mode "twittering-mode.el"
  "Major mode for twitter" t)
(setq twittering-username "shogo82148")
(setq twittering-use-master-password t)

(autoload 'php-mode "php-mode.el"
  "Major mode for PHP" t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

