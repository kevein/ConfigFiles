(tool-bar-mode -1)                     ; disable tool bar, must be -1, nil will caust toggle
(scroll-bar-mode -1)
(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0")
(add-to-list 'load-path "~/.emacs.d/elisp")

(require 'color-theme)
(color-theme-initialize)
(color-theme-gray30)
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

;;hide region
(require 'hide-region)
(global-set-key (kbd "C-c t") '(lambda () (interactive) (hide-region-hide) (deactivate-mark)))
(global-set-key (kbd "C-c y") 'hide-region-unhide-below)
(global-set-key (kbd "M-T") 'hide-region-toggle)

;; hide lines
;; (require 'hide-lines)
(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
(global-set-key (kbd "C-c g") 'hide-lines)
(global-set-key (kbd "C-c h") 'show-all-invisible)

;; highlight symbol
(require 'highlight-symbol)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c j") 'highlight-symbol-at-point)

;; set directory must before load ido, or it only save .ido.last
;; to that directory, but can not read when start up
(setq ido-save-directory-list-file "~/.emacs.d/.ido.last")
(require 'ido)
(ido-mode t)
(ido-everywhere 1)
(setq ido-enable-tramp-completion nil)
(global-set-key (kbd "<f12>") 'ido-switch-buffer)
(defun yp-ido-mode-init ()
  "document"
  (interactive)
  (define-key ido-completion-map (kbd "<f12>") 'ido-next-match)
  (define-key ido-completion-map (kbd "<f11>") 'ido-prev-match))
(add-hook 'ido-setup-hook 'yp-ido-mode-init)

