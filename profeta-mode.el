;; font-lock available faces:

;; font-lock-comment-face
;; font-lock-comment-delimiter-face
;; font-lock-doc-face
;; font-lock-string-face
;; font-lock-keyword-face
;; font-lock-builtin-face
;; font-lock-function-name-face
;; font-lock-variable-name-face
;; font-lock-type-face
;; font-lock-constant-face
;; font-lock-preprocessor-face
;; font-lock-negation-char-face
;; font-lock-warning-face

;; pairs of (regexp . face) for syntax highlighting
;; of course, ORDER of REGEXPS MATTERS!
(setq my-keywords
      `(
	;; addition and deletion of goals and beliefs:
	( "-~?\[a-zA-Z\]+()" .  font-lock-keyword-face )
	( "+~?\[a-zA-Z\]+()" .  font-lock-keyword-face )

	;; override some python operators
	( ,(regexp-opt '(">>") 'word) . font-lock-keyword-face)


	;; (,mylsl-type-regexp . font-lock-type-face)
	;; (,mylsl-constant-regexp . font-lock-constant-face)
	;; (,mylsl-event-regexp . font-lock-builtin-face)
	;; (,mylsl-functions-regexp . font-lock-function-name-face)
	;; (,mylsl-keywords-regexp . font-lock-keyword-face)
	
	;; numbers
	( "-? [0-9]+ (\.[0-9]+)? ([eE][+-]?[0-9]+)?" . font-lock-keyword-face )
	

	;; python operators
  	;; ( ,(regexp-opt '("[" "]" "|" ">>") 'word) . font-lock-warning-face)
	;; ( ,(regexp-opt '(">" "<" ">=" "<=" "==") 'word) . font-lock-keyword-face)

	;; actions into plans:
	;; ( " \[a-zA-Z0-9\]*(.*),\\| \[a-zA-Z0-9\]*(.*)$\\| \[a-zA-Z0-9\]*(.*)\t" . font-lock-variable-name-face)
	;; ( ,(regexp-opt '("and" "not" "or" "is" "lambda") 'words) . font-lock-keyword-face)
	;; ( ,(regexp-opt '("!" "&") 'word) . font-lock-keyword-face)
	;; ;; variables
	;; ( ,(regexp-opt '("A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z") 'words) . font-lock-variable-name-face)
	;; ;; more variables
	;; ( "\\<\[a-zA-Z0-9\]\[a-z0-9\]\\>" . font-lock-variable-name-face)
	;; ;; atoms
	;; ( "\\<\[a-z\]*\\>" . font-lock-variable-name-face)
	;; ;; addition and deletion of beliefs:
	;; ( "\+" .  font-lock-constant-face )
	;; ( "\-" .  font-lock-constant-face )
	)
      )

;; define profeta-mode
(define-derived-mode profeta-mode python-mode "Profeta Strategy"
  (setq font-lock-defaults '(my-keywords))
  
  ;; ;; modify the keymap
  ;; (define-key profeta-mode-map [remap comment-dwim] 'profeta-comment-dwim)
  
  ;; ;; python style comment: “# ...” 
  ;; (modify-syntax-entry ?# "< b" profeta-mode-syntax-table)
  ;; (modify-syntax-entry ?\n "> b" profeta-mode-syntax-table)
  )