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

;;; package名とファイル名が一致していなかった場合に警告
;;; http://d.hatena.ne.jp/syohex/20121214/1355464141
(defun cperl-get-package-name ()
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward "^\\s-*package\\s-+\\([^ ;]+\\)" nil t)
        (match-string-no-properties 1)
      "")))

(defun cperl-check-package-name ()
  (interactive)
  (let* ((path (file-name-sans-extension (buffer-file-name)))
         (package (replace-regexp-in-string "::" "/" (cperl-get-package-name)))
         (package-path (substring path (- (length path) (length package)))))
    (cond ((string= package "")
           (error "ぱっけーじせんげんがみつかりません＞＜"))
          ((not (string= package-path package))
           (error (concat "ぱっけーじめいと、ほぞんされているぱすが、ちがうきがします！\n"
                          "ちゃんとなおしてください＞＜"))))))

(defun cperl-check-package-name-hook ()
  (if (eq major-mode 'cperl-mode)
      (cperl-check-package-name)))

(add-hook 'after-save-hook 'cperl-check-package-name-hook)
