(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(load-theme 'wombat)
(xterm-mouse-mode 1) ;; Enable mouse in terminal

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'cargo-minor-mode)

(package-install 'autopair)

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
    (comment-edit edit-indirect rust-doctest-mode rust-edit-doctest use-package racer lsp-ui flymake-rust flycheck-rust flycheck-inline company-racer cargo autopair)))
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