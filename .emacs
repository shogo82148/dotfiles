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


;; markdown記法向け設定
;; http://jblevins.org/projects/markdown-mode/ をインストール
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))


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


;; Settings for auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
