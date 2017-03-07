;; Set some nice colors
(set-foreground-color "#E0DFDB")
(set-background-color "#102372")

;; Put line numbers in gutter
(global-linum-mode t)

;; Also show the columns for lining things up
(column-number-mode 1)

;; PUT backups somewhere nice
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))   ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode 1) 

;; color-themes
(add-to-list 'load-path "~/Development/color-theme-6.6.0")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-aalto-light)))

;; vi-style paren matching
(defun goto-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis, otherwise insert %.
vi style of % jumping to matching brace."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

;; Define a key to mimic vi functionality
(global-set-key (kbd "M-%") 'goto-match-paren)

;; Allow for overwrite of selected region with yanked text
(delete-selection-mode 1)
