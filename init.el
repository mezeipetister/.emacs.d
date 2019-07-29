(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; This is because a known bug.
;; comments says this bug should be fix in version 26.3
;; I use this fix to install rainbow-mode
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(load "~/.emacs.d/els/theme.el")
(load "~/.emacs.d/els/web.el")
(load "~/.emacs.d/els/global.el")
(load "~/.emacs.d/els/markdown.el")
(load "~/.emacs.d/els/rust.el")
(load "~/.emacs.d/els/mu4e.el")
(load "~/.emacs.d/els/calendar.el")
(load "~/.emacs.d/els/c.el")
(load "~/.emacs.d/els/compile.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(company-quickhelp-color-background "#3E4452")
 '(company-quickhelp-color-foreground "#ABB2BF")
 '(custom-safe-themes
   (quote
    ("0f1733ad53138ddd381267b4033bcb07f5e75cd7f22089c7e650f1bb28fc67f4" "fa477d10f10aa808a2d8165a4f7e6cee1ab7f902b6853fbee911a9e27cf346bc" "562c2a97808ab67d71c02d50f951231e4a6505f4014a01d82f8d88f5008bbe88" "6e38567da69b5110c8e19564b7b2792add8e78a31dfb270168509e7ae0147a8d" "bee55ba5e878d0584db9b2fb33f75c348a3008fcfe8e05ab8cae897ca604fd95" "ef07cb337554ffebfccff8052827c4a9d55dc2d0bc7f08804470451385d41c5c" "f07729f5245b3c8b3c9bd1780cbe6f3028a9e1ed45cad7a15dd1a7323492b717" "9f08dacc5b23d5eaec9cccb6b3d342bd4fdb05faf144bdcd9c4b5859ac173538" "51043b04c31d7a62ae10466da95a37725638310a38c471cc2e9772891146ee52" "030346c2470ddfdaca479610c56a9c2aa3e93d5de3a9696f335fd46417d8d3e4" "886fe9a7e4f5194f1c9b1438955a9776ff849f9e2f2bbb4fa7ed8879cdca0631" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" default)))
 '(nyan-animate-nyancat t)
 '(nyan-bar-length 20)
 '(nyan-cat-face-number 4)
 '(package-selected-packages
   (quote
    (kaolin-themes rainbow-delimiters ## rainbow-mode auto-complete yaml-mode meson-mode edit-server nyan-mode ede-php-autoload projectile flycheck-irony company-irony-c-headers helm-gtags ggtags unicode-fonts company-c-headers irony yasnippet web-mode vue-mode use-package racer one-themes moe-theme lsp-ui golden-ratio go-mode flymake-rust flycheck-rust flycheck-inline emmet-mode crux company-web company-racer cargo autopair atom-one-dark-theme)))
 '(send-mail-function (quote smtpmail-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
