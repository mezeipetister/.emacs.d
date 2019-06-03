;; (package-install 'irony)
;; (package-install 'company-irony)

;; (add-hook 'c-mode-hook 'company-mode)
;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))

(add-hook 'after-init-hook #'global-company-mode)

(add-hook 'c-mode-hook #'irony-mode)

(setq company-idle-delay 0.5)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(setq company-show-numbers t)
(setq company-tooltip-align-annotations t)

(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook #'my-irony-mode-hook)
(add-hook 'irony-mode-hook #'irony-cdb-autosetup-compile-options)

(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))
