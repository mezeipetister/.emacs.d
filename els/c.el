;; +--------------------------------------------------------------------------------------------------------------+
;; | Based on this tutorial:                       								  																							|
;; | https://wikemacs.org/wiki/C-ide              								  																							|
;; |                                                                                                              |
;; | This works great for struct auto copmletion:                                                                 |
;; | https://stackoverflow.com/questions/17763214/set-up-autocomplete-mode-in-emacs-to-work-well-with-c-structs   |
;; +--------------------------------------------------------------------------------------------------------------+

;; Global flycheck mode
(global-flycheck-mode)

;; o----------------------------------|
;; | TAB settings      	       	      |
;; |----------------------------------|
(defun my-tab ()
  "Insert a tab char. (ASCII 9, \t)."
  (interactive)
  (insert "\t"))
(global-set-key [C-return] 'my-tab)

(progn
  ;; make indentation commands use space only (never tab character)
  (setq-default indent-tabs-mode nil)
  ;; emacs 23.1 to 26, default to t
  ;; if indent-tabs-mode is t, it means it may use tab, resulting mixed space and tab
  )
;; set default tab char's display width to 4 spaces
(setq-default tab-width 2) ; emacs 23.1 to 26 default to 8
;; set current buffer's tab char's display width to 4 spaces
(setq tab-width 2)

;; Company mode
(add-hook 'after-init-hook 'global-company-mode)
;; CEDET/Semantic mode enable
(semantic-mode 1)
;; Irony mode
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;; DEMO
(require 'projectile)
(defun setup-flycheck-gcc-includes ()
  "Set gcc includes for flycheck using projectile."
  (let ((root (ignore-errors (projectile-project-root))))
    (when root
      (setq-local flycheck-gcc-include-path
        (mapcar (lambda (dir-x)
          (concat root dir-x)) (projectile-current-project-dirs))))))
(add-hook 'c-mode-hook 'setup-flycheck-gcc-includes)

;; DEMO
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)

(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; auto completion with company
(add-to-list 'company-backends 'company-c-headers)

(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

;; |-------------------------------------------------------|
;; | CEDET/Sematic custom includes for auto completion	   |
;; +-o-----------------------------------------------------|

;; GTK3
(require 'semantic/bovine/c)

;; +-------------------------------------------------------------|
;; |Found help for this here:					 |
;; |https://sourceforge.net/p/cedet/mailman/message/30025295/	 |
;;-|-----------o-------------------------------------------------+
(semantic-add-system-include "/usr/include/gtk-3.0/" 'c-mode)
