(tool-bar-mode -1)                     ; disable tool bar, must be -1, nil will caust toggle
(scroll-bar-mode -1)
(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-simple-1)
(global-set-key (kbd "C-;") 'yp-goto-next-line)
(global-set-key (kbd "C-M-;") 'yp-goto-prev-line)

(defun yp-goto-next-line ()
  "document"
  (interactive)
  (end-of-line)
  (newline-and-indent))
(defun yp-goto-prev-line ()
  "document"
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (beginning-of-line 0)
  (indent-according-to-mode))

(setq-default make-backup-files nil)
(global-font-lock-mode 't)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)
