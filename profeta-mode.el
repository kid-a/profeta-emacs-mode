;; the command to comment/uncomment text
(defun masahiro-comment-dwim (arg)
  "Comment or uncomment current line or region in a smart way.
For detail, see `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let ((deactivate-mark nil) (comment-start "#") (comment-end ""))
    (comment-dwim arg)))

;; keywords for syntax coloring
(setq myKeywords
      `(
	;; BE CAREFUL WHEN EDITING: REGEXPS ORDER MATTERS!
	;; addition and deletion of goals:
	( "-~\[a-zA-Z\]*" .  font-lock-keyword-face )
	( "+~\[a-zA-Z\]*" .  font-lock-keyword-face )
	;; some python operators
  	( ,(regexp-opt '("[" "]" "|" ">>") 'word) . font-lock-warning-face)
	( ,(regexp-opt '(">" "<" ">=" "<=" "==") 'word) . font-lock-keyword-face)
	;; actions into plans:
	( " \[a-zA-Z0-9\]*(.*),\\| \[a-zA-Z0-9\]*(.*)$\\| \[a-zA-Z0-9\]*(.*)\t" . font-lock-variable-name-face)
	( ,(regexp-opt '("and" "not" "or" "is" "lambda") 'words) . font-lock-keyword-face)
	( ,(regexp-opt '("!" "&") 'word) . font-lock-keyword-face)
	;; variables
	( ,(regexp-opt '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z") 'words) . font-lock-variable-name-face)
	;; more variables
	( "\\<\[a-zA-Z0-9\]\[a-z0-9\]\\>" . font-lock-variable-name-face)
	;; atoms
	( "\\<\[a-z\]*\\>" . font-lock-variable-name-face)
	;; addition and deletion of beliefs:
	( "\+" .  font-lock-constant-face )
	( "\-" .  font-lock-constant-face )
	)
      )

;; define the major mode.
(define-derived-mode masahiro-mode fundamental-mode
"Masahiro Strategy"
  (setq font-lock-defaults '(myKeywords))

  ;; modify the keymap
  (define-key masahiro-mode-map [remap comment-dwim] 'masahiro-comment-dwim)

  ;; python style comment: “# ...” 
  (modify-syntax-entry ?# "< b" masahiro-mode-syntax-table)
  (modify-syntax-entry ?\n "> b" masahiro-mode-syntax-table)
)