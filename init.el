(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(load "~/.emacs.d/els/theme.el")
(load "~/.emacs.d/els/web.el")
(load "~/.emacs.d/els/global.el")
(load "~/.emacs.d/els/markdown.el")
(load "~/.emacs.d/els/rust.el")
(load "~/.emacs.d/els/mu4e.el")
(load "~/.emacs.d/els/calendar.el")
(load "~/.emacs.d/els/c.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nyan-mode ede-php-autoload projectile flycheck-irony company-irony-c-headers helm-gtags ggtags unicode-fonts company-c-headers irony yasnippet web-mode vue-mode use-package racer one-themes moe-theme lsp-ui golden-ratio go-mode flymake-rust flycheck-rust flycheck-inline emmet-mode crux company-web company-racer cargo autopair atom-one-dark-theme)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
