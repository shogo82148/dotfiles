(autoload 'web-mode "web-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("template-toolkit" . "\\.html?\\'" )))

(defun my-web-mode-hook ()
  "Hooks for Web mode."

  (setq-default indent-tabs-mode nil) ; インデントにタブを使用しない

  ;; web-mode. colors.
  (set-face-attribute 'web-mode-doctype-face nil :foreground "#4A8ACA")
  (set-face-attribute 'web-mode-html-tag-face nil :foreground "#4A8ACA")
  (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#87CEEB")
  (set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#FFFFFF")
  (set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#D78181")
  (set-face-attribute 'web-mode-comment-face nil :foreground "#587F35")
  (set-face-attribute 'web-mode-server-comment-face nil :foreground "#587F35")

  ;; web-mode. css colors.
  (set-face-attribute 'web-mode-css-at-rule-face nil :foreground "#DFCF44")
  (set-face-attribute 'web-mode-comment-face nil :foreground "#587F35")
  (set-face-attribute 'web-mode-css-selector-face nil :foreground "#DFCF44")
  (set-face-attribute 'web-mode-css-pseudo-class nil :foreground "#DFCF44")
  (set-face-attribute 'web-mode-css-property-name-face nil :foreground "#87CEEB")
  (set-face-attribute 'web-mode-css-string-face nil :foreground "#D78181")
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)
