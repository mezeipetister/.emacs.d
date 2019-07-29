(require 'kaolin-themes)
(load-theme 'kaolin-dark t)
;; Apply treemacs customization for Kaolin themes, requires the all-the-icons package.
(kaolin-treemacs-theme)

(set-frame-font "Inconsolata-12")

(set-face-foreground 'font-lock-doc-face "grey")
(set-face-foreground 'font-lock-comment-face "grey")
;;(package-install 'atom-one-dark-theme)
;;(load-theme 'atom-one-dark t)
(xterm-mouse-mode 1) ;; Enable mouse in terminal
(tool-bar-mode -1) ;; Disable toolbar
