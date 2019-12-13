;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Extremely basic evil config instead of enabling evil module
(use-package! evil
  :init (evil-mode 1)
  :config (setq evil-want-fine-undo t))

(use-package! cdlatex
  :hook (LaTeX-mode . turn-on-cdlatex)
  (latex-mode . turn-on-cdlatex)
  ;; Disable some cdlatex binds
  :config (define-key cdlatex-mode-map "(" nil)
  (define-key cdlatex-mode-map "{" nil)
  (define-key cdlatex-mode-map "[" nil)
  (define-key cdlatex-mode-map "|" nil)
  (define-key cdlatex-mode-map "<" nil)
  (define-key cdlatex-mode-map "$" nil)
  )

;; Rmarkdown
(use-package! polymode
  :mode ("\\.Rmd" . poly-markdown+r-mode))

(after! latex
  ;; Don't ask to save before compiling
  (setq TeX-save-query nil))

(after! undo-tree
  (global-undo-tree-mode)
  (setq undo-tree-auto-save-history t))

(after! yasnippet
  (setq yas-triggers-in-field t))

(after! flyspell
  (add-hook! prog-mode flyspell-prog-mode)
  (add-hook! text-mode flyspell-mode))

(use-package! flyspell-popup
  :hook (flyspell-mode . flyspell-popup-auto-correct-mode))

(global-set-key (kbd "C-c C-/") (quote comment-line))
(global-set-key (kbd "C-c C-SPC") (quote comment-line))
(setq-default c-basic-offset 4 c-default-style "linux")
;; Disable tab indentation, use spaces
(setq-default indent-tabs-mode nil)
;; Tab size to be 4 spaces
(setq tab-stop-list (number-sequence 4 200 4))
(setq tab-width 4)

(+global-word-wrap-mode 1)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'meta))

;; Add auto-fill to text-mode by default
(add-hook 'text-mode-hook 'auto-fill-mode)
;; Set yes-or-no to always be y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

(setq doc-view-continuous t)
