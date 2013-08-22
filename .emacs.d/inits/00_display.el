
;; タブ, 全角スペースを表示する
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
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

; 行末のスペースを表示
(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))

; 指定した単語をハイライト表示
; http://d.hatena.ne.jp/kitokitoki/20100610/p2

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


;; バッファ名がかぶった時に親ディレクトリを表示
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
