; kuin-mode.el
; Maintainer:    @tatt61880
; Last Modified: 2012/08/04 10:16:27.
;
; How to use
; 1. Put this file (kuin-mode.el) into emacs setting folder.
; 2. Add next 5 lines into .emacs
;   ; Settings for Kuin
;   (autoload 'kuin-mode "kuin-mode" nil t)
;   (add-hook 'kuin-mode-hook '(lambda () (font-lock-mode 1)))
;   (setq auto-mode-alist
;   (cons (cons "\\.kn$" 'kuin-mode) auto-mode-alist))
;

(defvar kuin-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?_ "w" table)
    (modify-syntax-entry ?{ ". 1" table) ; FIXME
    (modify-syntax-entry ?} ". 4" table) ; FIXME
    (modify-syntax-entry ?  ". 23" table) ; FIXME
    (modify-syntax-entry ?\t ". 23" table) ; FIXME
    (modify-syntax-entry ?\r ". 23" table) ; FIXME
    (modify-syntax-entry ?\n ". 23" table) ; FIXME
    table)
  "Syntax table used in kuin-mode buffers.")

(defvar kuin-font-lock-defaults
  (list
    'kuin-font-lock-keywords
    nil ; keywords-only = nil
    nil ; case-fold = nil i.e. case-sensitiveh
    nil ; syntax-alist
    'beginning-of-line
    ))

(defconst kuin-font-lock-keywords
          '(
            ("\\<[0-9]+_[0-9]+\\>"          ; " contained (e.g 1_000_000) => Warning
             . (0 font-lock-warning-face))
            ("\\<\\w*[a-zA-Z_]\\w*#\\w+\\>" ; " a-z A-Z _ contained pre # => Warning
             . (0 font-lock-warning-face))
            ("\\<\\w+#\\w*[a-z_]\\w*\\>"    ; " a-z _ contained post # => Warning
             . (0 font-lock-warning-face))
            ("#\\w*[a-z_]\\w*\\>"           ; " #ff => Warning
             . (0 font-lock-warning-face))
            ("\\<2#[0-1]+\\(\\.[0-1]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<3#[0-2]+\\(\\.[0-2]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<4#[0-3]+\\(\\.[0-3]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<5#[0-4]+\\(\\.[0-4]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<6#[0-5]+\\(\\.[0-5]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<7#[0-6]+\\(\\.[0-6]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<8#[0-7]+\\(\\.[0-7]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<9#[0-8]+\\(\\.[0-8]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<11#[0-9A-A]+\\(\\.[0-9A-A]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<12#[0-9A-B]+\\(\\.[0-9A-B]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<13#[0-9A-C]+\\(\\.[0-9A-C]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<14#[0-9A-D]+\\(\\.[0-9A-D]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<15#[0-9A-E]+\\(\\.[0-9A-E]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<17#[0-9A-G]+\\(\\.[0-9A-G]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<18#[0-9A-H]+\\(\\.[0-9A-H]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<19#[0-9A-I]+\\(\\.[0-9A-I]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<20#[0-9A-J]+\\(\\.[0-9A-J]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<21#[0-9A-K]+\\(\\.[0-9A-K]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<22#[0-9A-L]+\\(\\.[0-9A-L]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<23#[0-9A-M]+\\(\\.[0-9A-M]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<24#[0-9A-N]+\\(\\.[0-9A-N]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<25#[0-9A-O]+\\(\\.[0-9A-O]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<26#[0-9A-P]+\\(\\.[0-9A-P]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<27#[0-9A-Q]+\\(\\.[0-9A-Q]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<28#[0-9A-R]+\\(\\.[0-9A-R]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<29#[0-9A-S]+\\(\\.[0-9A-S]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<30#[0-9A-T]+\\(\\.[0-9A-T]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<31#[0-9A-U]+\\(\\.[0-9A-U]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<32#[0-9A-V]+\\(\\.[0-9A-V]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<33#[0-9A-W]+\\(\\.[0-9A-W]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<34#[0-9A-X]+\\(\\.[0-9A-X]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<35#[0-9A-Y]+\\(\\.[0-9A-Y]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<36#[0-9A-Z]+\\(\\.[0-9A-Z]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<[0-9]+#[0-9A-Z]+\\>"                ; e.g. 100#1, 3#3 => Warning
             . (0 font-lock-warning-face))
            ("\\<16#[0-9A-F]+\\(\\.[0-9A-F]+\\)?\\>" ; 16#FFFF => Warning
             . (0 font-lock-warning-face))
                 ("#[0-9A-F]+\\(\\.[0-9A-F]+\\)?\\>" ;   #FFFF
             . (0 font-lock-constant-face))
            ("\\<0\\(\\.[0-9]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<[1-9][0-9]*\\(\\.[0-9]+\\)?\\>"
             . (0 font-lock-constant-face))
            ("\\<[0-9]\\w*\\>"
             . (0 font-lock-warning-face))

            ("\\<import\\>"
             . (0 font-lock-preprocessor-face))
            ("\\<\\(int\\|byte8\\|byte16\\|byte32\\|byte64\\|sbyte8\\|sbyte16\\|sbyte32\\|sbyte64\\|float\\|char\\|bool\\|complex\\|money\\|ratio\\|list\\|stack\\|queue\\|dict\\)\\>"
             . (0 font-lock-type-face))
            ("\\<func\\>"
             . (0 font-lock-function-name-face))
            ("\\<\\(skip\\|block\\|end\\|var\\|do\\|break\\|return\\|continue\\|assert\\|ifdef\\|debug\\|release\\)\\>"
             . (0 font-lock-keyword-face))
            ("@new\\>"
             . (0 font-lock-keyword-face))

            ("\\<\\(case\\|default\\)\\>"
             . (0 font-lock-keyword-face))
            ("\\<\\(if\\|else\\|elif\\|switch\\)\\>"
             . (0 font-lock-keyword-face))
            ("\\<\\(while\\|for\\|foreach\\)\\>"
             . (0 font-lock-keyword-face))
            ("\\<\\(throw\\|try\\|catch\\|finally\\)\\>"
             . (0 font-lock-keyword-face))
            ("\\<\\(true\\|false\\)\\>"
             . (0 font-lock-constant-face))
            ("\\<\\(null\\|nan\\|inf\\)\\>"
             . (0 font-lock-constant-face))

            ("'''"
             . (0 font-lock-warning-face))
            ("'[\n\r\t]+'"
             . (0 font-lock-warning-face))
            ("'\\\\.'" ; char '\.'
             . (0 font-lock-constant-face))
            ("'[^\\s\\\\]'" ; char '.'
             . (0 font-lock-constant-face))
            ("\"[^\"]*\"" ; FIXME for "__\"__"
             . (0 font-lock-string-face))

            ("@\\(is\\|nis\\|in\\|nin\\|to\\)\\>"
             . (0 font-lock-keyword-face))

            )
  "Additional expressions to highlight in Kuin mode.")

;====================================

(defcustom kuin-indent 4
           "Number of columns for a unit of indentation in Kuin mode.
           See also `\\[kuin-guess-indent]'"
           :type 'integer
           :group 'kuin)

(put 'kuin-indent 'safe-local-variable 'integerp)

(defvar kuin-indent-index 0
  "Internal use.")

(defun kuin-indent-line ()
  "Indent current line as Kuin code."
  (beginning-of-line)
  (save-excursion
    (while (progn ; move to non-blank
	     (not (or (equal (forward-line -1) -1)
		      (not (looking-at "^\s*$"))
		      )
		  )))
    (if (string-match "^\s*\\<\\(block\\|func\\|class\\|enum\\|ifdef\\|if\\|elif\\|else\\|switch\\|case\\|while\\|for\\|foreach\\|try\\|catch\\|finally\\)\\>" (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
      (setq kuin-indent-index (+ (current-indentation) kuin-indent)) ; current-indent > prev-line-indent
      (setq kuin-indent-index (current-indentation)) ; current-indent = prev-line-indent
      ))
  (if (string-match "^\s*\\<\\(end\\|elif\\|else\\|case\\|catch\\|finally\\)\\>" (buffer-substring-no-properties (point-at-bol) (point-at-eol)))
    (setq kuin-indent-index (- kuin-indent-index kuin-indent)) ; current-indent < prev-line-indent
    )
  (save-excursion ; first-line-indent = 0
    (if (equal (forward-line -1) -1)
      (setq kuin-indent-index 0)
      )
    )

  (save-excursion
    (beginning-of-line)
    (re-search-forward "[\s\t]*")
    (replace-match "")
    )
    (indent-to kuin-indent-index)
  )

(add-hook 'kuin-mode-hook
          '(lambda ()
             (setq indent-tabs-mode nil)
             ))

;; Main function for Kuin mode
(defun kuin-mode ()
  ""
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table kuin-mode-syntax-table)
  (setq mode-name "kuin")
  (setq case-fold-search nil)
  (set (make-local-variable 'indent-line-function) #'kuin-indent-line)
  (set (make-local-variable 'font-lock-defaults) kuin-font-lock-defaults )
  (set (make-local-variable 'parse-sexp-ignore-comments) t)
  (run-hooks 'kuin-mode-hook)
  )

(provide 'kuin-mode)

;; kuin-mode.el EOF

