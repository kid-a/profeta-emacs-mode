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
	( "-[~]?[a-zA-Z_][a-zA-Z0-9_]*" . font-lock-warning-face )
	( "+[~]?[a-zA-Z_][a-zA-Z0-9_]*" . font-lock-type-face )
	
	;; some reserved words
	( ,(regexp-opt '("def " "from " "import " "declare_episode")) . font-lock-preprocessor-face )
	
	;; the '>>' symbol
	( ,(regexp-opt '(">>") 'word) . font-lock-builtin-face)
	
	;; numbers
	( "\\b[0-9]*[\.]?[0-9]+" . font-lock-constant-face )
	)
      )

;; add command shortcut for comments

;; define profeta-mode
(define-derived-mode profeta-mode python-mode "Profeta Strategy"
  (setq font-lock-defaults '(my-keywords))
  
  ;; ;; modify the keymap
  ;; (define-key profeta-mode-map [remap comment-dwim] 'profeta-comment-dwim)
  
  ;; ;; python style comment: “# ...”
  ;; (modify-syntax-entry ?# "< b" profeta-mode-syntax-table)
  ;; (modify-syntax-entry ?\n "> b" profeta-mode-syntax-table)
  )