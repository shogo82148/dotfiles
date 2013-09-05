;; CSV 向け設定
(require 'csv-mode)
(autoload 'csv-mode "csv-mode.el"
  "Major mode for editing csv files" t)
(add-to-list 'auto-mode-alist '("\\.csv$" . csv-mode))
(csv-align-fields t (point-min) (point-max))
