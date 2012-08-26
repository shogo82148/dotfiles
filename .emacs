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


;; タブ, 全角スペース、改行直前の半角スペースを表示する
;;(defface my-face-r-1 '((t (:background "gray15"))) nil)
(defface my-face-b-1 '((t (:background "gray"))) nil)
(defface my-face-b-2 '((t (:background "gray26"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
;;(defvar my-face-r-1 'my-face-r-1)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-u-1 append)
     ("　" 0 my-face-b-1 append)
     ("[ \t]+$" 0 my-face-b-1 append)
     ;;("[\r]*\n" 0 my-face-r-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

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


(defun keep-highlight-regexp (re)
  (interactive "sRegexp: \n")
  (make-face 'my-highlight-face)
  (set-face-foreground 'my-highlight-face "black")
  (set-face-background 'my-highlight-face "yellow")
  (defvar my-highlight-face 'my-highlight-face)
  (setq font-lock-set-defaults nil)
  (font-lock-set-defaults)
  (font-lock-add-keywords 'nil (list (list re 0 my-highlight-face t)))
  (font-lock-fontify-buffer))

(defun cancel-highlight-regexp ()
  (interactive)
  (setq font-lock-set-defaults nil)
  (font-lock-set-defaults)
  (font-lock-fontify-buffer))

(global-set-key "\C-f" 'keep-highlight-regexp)
(global-set-key "\C-d" 'cancel-highlight-regexp)

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
