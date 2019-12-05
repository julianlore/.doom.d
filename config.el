;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(map! :v  "@"     #'+evil:apply-macro
      ;; Revert omni-completion C-x C-s
      (:when (featurep! :completion company)
        (:prefix "C-x"
          :i "C-s"    #'save-buffer)))
