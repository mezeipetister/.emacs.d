;; RUST MODE
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)
(add-hook 'rust-mode-hook #'cargo-minor-mode)

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(require 'rust-mode)
(define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)

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
