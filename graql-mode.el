;;; graql-mode.el --- sample major mode for editing LSL. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2020, by you

;; Author: Diwank Singh Tomer ( singh@diwank.name )
;; Version: 1.0.0
;; Created: 26 Dec 2019
;; Keywords: languages
;; Homepage: https://github.com/creatorrr/emacs-graql-mode

;; This file is not part of GNU Emacs.

;;; License:

;; You can redistribute this program and/or modify it under the terms of the MIT License.

;;; Commentary:

;; Major mode that provides syntax highlighting and basic completion for GraQL

;; create the list for font-lock.
;; each category of keyword is given a particular face
(setq graql-font-lock-keywords
   (let* (
     ;; define several category of keywords
     (x-keywords
      '("define" "undefine" "match" "get" "insert" "delete" "compute"))
     (x-types
      '("long" "double" "string" "val" "boolean" "date" "thing" "entity"
        "attribute" "relation" "role" "rule"))
     (x-constants
      '("true" "false" "abstract" "id" "asc" "desc" "type"
        "aggregate"))
     (x-events
      '("offset" "limit" "group" "order by" "datatype" "key" "of" "in" "when"
        "then" "if" "has" "plays" "relates" "involves"
        "sub!" "isa!" "sub" "isa"))
     (x-functions
      '("centrality" "is-abstract" "using" "or" "not" "as" "via" "like"
        "contains" "regex" "max" "min" "std" "mean" "median" "sum" "count"
        "degree" "path" "cluster"))

         ;; generate regex string for each category of keywords
     (x-keywords-regexp (regexp-opt x-keywords 'symbols))
     (x-types-regexp (regexp-opt x-types 'symbols))
     (x-constants-regexp (regexp-opt x-constants 'symbols))
     (x-events-regexp (regexp-opt x-events 'symbols))
     (x-functions-regexp (regexp-opt x-functions 'symbols)))

     `(
       (,x-types-regexp . font-lock-type-face)
       (,x-constants-regexp . font-lock-constant-face)
       (,x-events-regexp . font-lock-builtin-face)
       (,x-functions-regexp . font-lock-function-name-face)
       (,x-keywords-regexp . font-lock-keyword-face))))
       ;; note: order above matters, because once colored, that part won't change.
       ;; in general, put longer words first


;;;###autoload
(define-derived-mode graql-mode fish-mode "graql mode"
  "Major mode for editing GraQL files."

  ;; code for syntax highlighting
  (setq font-lock-defaults '((graql-font-lock-keywords))))

(add-to-list 'auto-mode-alist '("\\.graql\\'" . graql-mode))

;; add the mode to the `features' list
(provide 'graql-mode)

;;; graql-mode.el ends here
