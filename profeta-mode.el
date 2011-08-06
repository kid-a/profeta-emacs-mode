;; -----------------------------------------------------------------------------
;; font-lock available faces
;; -----------------------------------------------------------------------------
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

;; -----------------------------------------------------------------------------
;; define pairs of (regexp . face) for syntax highlighting
;; of course, ORDER of REGEXPS DOES MATTER!
;; -----------------------------------------------------------------------------
(setq my-keywords
      `(
	;; addition and deletion of goals and beliefs:
	( "-[~]?[a-zA-Z_][a-zA-Z0-9_]*" . font-lock-warning-face )
	( "+[~]?[a-zA-Z_][a-zA-Z0-9_]*" . font-lock-type-face )

	;; some reserved words
	( ,(regexp-opt '("def " "from " "import " "declare_episode")) .
	  font-lock-preprocessor-face )

	;; the '>>' symbol
	( ,(regexp-opt '(">>") 'word) . font-lock-builtin-face)

	;; numbers
	( "\\b[0-9]*[\.]?[0-9]+" . font-lock-constant-face )
	)
      )

;; -----------------------------------------------------------------------------
;; assign keyboard shortcuts
;; -----------------------------------------------------------------------------
(defvar profeta-mode-map nil "Keymap for profeta-mode")

(when (not profeta-mode-map)
  ;; create a new keymap
  (setq profeta-mode-map (make-sparse-keymap))

  ;; comment with C-c C-c
  (define-key profeta-mode-map (kbd "C-c C-c") 'comment-region))

;; -----------------------------------------------------------------------------
;; define profeta-mode
;; -----------------------------------------------------------------------------
(define-derived-mode profeta-mode python-mode "Profeta Strategy"
  (setq font-lock-defaults '(my-keywords))
  )
