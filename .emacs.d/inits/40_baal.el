;;; baal-mode

(define-generic-mode baal-mode
  ;; コメントになる文字列の指定
  '(("/#" . "#/")
    ("/*" . "*/"))
  ;; キーワードの指定
  '("namespace" "entity" "service" "includes" "required" "nullable" "of" "import" "abstract" "list" "dictionary" "hash" "map" "accepts" "returns" "as")
  ;; もうちょっと難しいキーワードの指定
  '(
    ("\\b\\(bool\\(ean\\)?\\|int\\(eger\\|8\\|16\\|32\\|64\\)\\|sbyte\\|byte\\|short\\|long\\|float\\(32\\|64\\)?\\|double\\|real\\|number\\|decimal\\(32\\|64\\)?\\|numeric\\|money\\|date\\(time\\)?\\|time\\(stamp\\)?\\|str\\(ing\\)?\\|bin\\(ary\\)?\\)\\b" . font-lock-type-face)
    ("[A-Z][a-zA-Z0-9.]+" . font-lock-function-name-face)
    )
  '(".*\.faced")
  nil
  "Major mode for baal")
