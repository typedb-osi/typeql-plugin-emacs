;;; typeql-mode.el -*- coding: utf-8; lexical-binding: t; -*-\

;;; License:
;; You can redistribute this program and/or modify it under the terms of the MIT License.

;;; Commentary:
;; Major mode that provides syntax highlighting and basic completion for typeql

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq typeql-font-lock-keywords
   (modify-syntax-entry ?@ "w" typeql-mode-syntax-table)
   (let* (
     ;; define several category of keywords
     (x-keywords
      '("define" "undefine" "match" "get" "insert" "delete" "offset" "limit" "group" "sort" "asc" "desc" "sub" "abstract" "as" "iid" "type" "isa" "isa!" "sub" "sub!" "owns" "has" "plays" "relates" "value" "regex" "rule" "when" "then" "@key" "@unique" "count" "sum" "max" "min" "mean" "median" "std" "@key" "@unique"))
     (x-othertypes
      '("thing" "entity" "attribute" "relation" "role"))
     (x-punctuations
      '(">=" "<=" ">" "<" "==" "="))
     (x-types
      '("string" "long" "double" "boolean" "datetime" "true" "false"))
     (x-functions
      '("or" "not" "like" "is"))

         ;; generate regex string for each category of keywords
     (x-keywords-regexp (regexp-opt x-keywords 'symbols))
     (x-othertypes-regexp (regexp-opt x-othertypes 'symbols))
     (x-punctuations-regexp (regexp-opt x-punctuations 'symbols))
     (x-types-regexp (regexp-opt x-types 'symbols))
     (x-functions-regexp (regexp-opt x-functions 'symbols)))

     `(
       (,x-othertypes-regexp . font-lock-type-face)
       (,x-types-regexp . font-lock-function-name-face)
       (,x-punctuations-regexp . font-lock-keyword-face)
       (,x-functions-regexp . font-lock-keyword-face)
       (,x-keywords-regexp . font-lock-keyword-face))))
       ;; note: order above matters, because once colored, that part won't change.
       ;; in general, put longer words first


;;;###autoload
(define-derived-mode typeql-mode fish-mode "typeql mode"
  "Major mode for editing typeql files."

  ;; code for syntax highlighting
  (setq font-lock-defaults '((typeql-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\.typeql\\'" . typeql-mode))

;; add the mode to the `features' list
(provide 'typeql-mode)

;;; typeql-mode.el ends here
