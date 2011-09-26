(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
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

(global-set-key (kbd "C-;") 'yp-goto-next-line)
(global-set-key (kbd "C-M-;") 'yp-goto-prev-line)

;; ibuffer
(require 'ibuffer)
(defvar ibuffer-first-flag t
  "after the first time call it, it set to nil")
(defun ibuffer-and-sort ()
  "switch to ibuffer and
sort by major mode if first time call"
  (interactive)
  (ibuffer)
  (if ibuffer-first-flag
      (progn
        (ibuffer-do-sort-by-major-mode)
        (setq ibuffer-first-flag nil))))
  
(global-set-key (kbd "<f11>") 'ibuffer-and-sort)

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
(put 'dired-find-alternate-file 'disabled nil)
