;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(map! :v  "@"     #'+evil:apply-macro
      ;; Revert omni-completion C-x C-s
      (:when (featurep! :completion company)
        (:prefix "C-x"
          :i "C-f"    #'find-file
          :i "C-s"    #'save-buffer)))

(after! evil
  (setq evil-want-fine-undo t))

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

(global-set-key [3 67108911] (quote comment-line))
  (global-set-key (kbd "C-c C-SPC") (quote comment-line))
  (setq-default c-basic-offset 4 c-default-style "linux")
  ;; Disable tab indentation, use spaces
  (setq-default indent-tabs-mode nil)
  ;; Tab size to be 4 spaces
  (setq tab-stop-list (number-sequence 4 200 4))
  (setq tab-width 4)

  (when (fboundp 'windmove-default-keybindings)
    (windmove-default-keybindings 'meta))

  ;; Add auto-fill to text-mode by default
  (add-hook 'text-mode-hook 'auto-fill-mode)
;; Set yes-or-no to always be y-or-n
(fset 'yes-or-no-p 'y-or-n-p)
