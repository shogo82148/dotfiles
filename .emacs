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

;C言語のインデントを4桁に
(setq-default c-basic-offset 4)

;Javascript向け設定
;https://github.com/mooz/js2-mode を使用
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;;Ruby向け設定
(autoload 'ruby-mode "ruby-mode"
  "Ruby editing mode")
(add-to-list 'auto-mode-alist '("\\.rb" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'run-ruby "inf-ruby" "")
(autoload 'inf-ruby-keys "inf-ruby" "")
(add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
             ))

;; Lua向け設定
;; http://immerrr.github.com/lua-mode/ をインストール
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))


;; markdown記法向け設定
;; http://jblevins.org/projects/markdown-mode/ をインストール
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))



; インデントにタブを使用しない
(setq-default indent-tabs-mode nil)

(add-hook 'c-mode-hook
          (lambda () (c-set-style "cc-mode")))
(add-hook 'c++-mode-hook
          (lambda () (c-set-style "cc-mode")))

; Settings for Kuin
; http://dl.dropbox.com/u/9975638/kuin/emacs/index.html
(autoload 'kuin-mode "kuin-mode" nil t)
(add-hook 'kuin-mode-hook '(lambda () (font-lock-mode 1)))
(setq auto-mode-alist
      (cons (cons "\\.kn$" 'kuin-mode) auto-mode-alist))

; termの設定
(require 'term)

(global-set-key "\C-t" '(lambda ()(interactive)(ansi-term "/bin/bash")))

(defvar ansi-term-after-hook nil)
(add-hook 'ansi-term-after-hook
(function
(lambda ()
(define-key term-raw-map "\C-t" '(lambda ()(interactive)(ansi-term "/bin/bash"))))))

(defadvice ansi-term (after ansi-term-after-advice (arg))
"run hook as after advice"
(run-hooks 'ansi-term-after-hook))
(ad-activate 'ansi-term)


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
