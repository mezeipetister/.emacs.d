(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load-theme 'wombat)
(set-face-foreground 'font-lock-doc-face "grey")
(set-face-foreground 'font-lock-comment-face "grey")
;;(package-install 'atom-one-dark-theme)
;;(load-theme 'atom-one-dark t)
(xterm-mouse-mode 1) ;; Enable mouse in terminal

;; WEB DEVELOPMENT
;;
;; Install packages:
;; web-mode: highlighting, indentation, closing tags, jumping tags, commenting
;; company-web: completion of keywords as you type
;; yasnippet: shortcut to write a snippet
;; emmet-mode: smarter yasnippet

(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
(defun my-web-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
  )
(add-hook 'web-mode-hook  'emmet-mode)

(setq vue-mode-packages
  '(vue-mode))

(setq vue-mode-excluded-packages '())

(defun vue-mode/init-vue-mode ()
  "Initialize my package"
  (use-package vue-mode))

;; RUST MODE
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'cargo-minor-mode)

(package-install 'autopair)
(package-install 'crux)
(package-install 'go-mode)

;; Loading mu4e config
;;(load "~/.emacs.d/mu4e.el")
;; Loading Org mode config
;;(load "~/.emacs.d/org.el")
;; Loading Calendar customs
(load "~/.emacs.d/calendar.el")

(use-package crux
  :bind (("C-c o" . crux-open-with)
         ("C-a" . crux-move-beginning-of-line)))

;; markdown mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; this helps for pdf creation
(setq markdown-command "/usr/bin/pandoc")
;; -end

;; Once this mode is enabled, the selected text is going to be rewritten
(delete-selection-mode 1)

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
(setq company-tooltip-align-annotations t)

(autopair-global-mode)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (vue-mode emmet-mode yasnippet company-web web-mode moe-theme nimbus-theme one-themes go-mode atom-one-dark-theme golden-ratio crux mu4e-alert comment-edit edit-indirect rust-doctest-mode rust-edit-doctest use-package racer lsp-ui flymake-rust flycheck-rust flycheck-inline company-racer cargo autopair)))
 '(send-mail-function (quote smtpmail-send-it))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Custom key bindings and templates

(global-set-key (kbd "C-c t t") 'template-insert-rust-unit-test)
(global-set-key (kbd "C-c t c") 'template-insert-copyright-general)

(defun template-insert-rust-unit-test()
  "Insert Rust unit test template."
  (interactive)
  (insert "// Unit tests
#[cfg(test)]
mod tests {
    #[test]
    fn demo_test() {
        let a = 1;
        let b = 2;
        assert_eq!(a + b, 3);
    }
}"))

(defun template-insert-copyright-general()
  "Insert general copyright template."
  (interactive)
  (insert "// Copyright 2019 Peter Mezei
// https://github.com/mezeipetister
// For more details please check the readme and LICENSE files enclosed."))
