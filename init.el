(tool-bar-mode -1)                     ; disable tool bar, must be -1, nil will caust toggle
(scroll-bar-mode -1)
(menu-bar-mode -1)

(add-to-list 'load-path "~/.emacs.d/elisp/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-black)

