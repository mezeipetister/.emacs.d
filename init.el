;;; init.el --- This is my personel emacs conifg

;;; Commentary:
;;    @author:    Peter Mezei
;;    @license:   MIT
;;    @help:      github.com/mezeipetister
;;; code:
(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(nyan-animate-nyancat t)
 '(nyan-bar-length 20)
 '(nyan-cat-face-number 4)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages
   (quote
    (build-status travis yaml-mode go-dlv magit markdown-mode sr-speedbar exec-path-from-shell company-go helm-go-package helm-gtags ggtags go-mode kaolin-themes nyan-mode autopair company)))
 '(speedbar-show-unknown-files t))

(package-initialize)

;; Required packaged
;; to install before use
(setq init-packages-to-install
      (quote (use-package
               nyan-mode            ;; most important package
               autopair
               company              ;; auto completion
               company-go           ;; company-go company mode
               crux                 ;; open files by def. sys. app
               kaolin-themes        ;; my custom theme
               all-the-icons        ;; required by kaolin-themes
               flycheck             ;; Flycheck-mode
               go-mode              ;; Go-mode
               ggtags               ;; GGTAGS mode
               helm-go-package      ;; heml go package
               helm-gtags           ;; helm-gtags mode
               exec-path-from-shell ;; package for godoc
               sr-speedbar          ;;
               markdown-mode        ;;
               yaml-mode            ;;
               travis               ;; Travis-mode
               build-status         ;; Show travis-ci build status in minor mode
	       )))

;; Rewrite selected text
;; Without this mode, the selected
;; text would not be overwritten.
(delete-selection-mode 1)

;; Autopair global mode
;; Automatically insert a pair
;; of any "pairy" character
;; ( => ()
;; { => {}
;; [ => []
(autopair-global-mode)

;; Global display line number
(global-display-line-numbers-mode)

;; Speedbar
;; Display all files

(global-set-key (kbd "<f1>")
                'speedbar)

;; Bind F10 to set on/off tool-bar-mode
(global-set-key (kbd "<f10>")
                'tool-bar-mode)

;; Set fill-column
(setq-default fill-column 80)

;; Set UTF-8
;; as default
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Line move UP/DOWN
;; Ctrl + Shift + UP    => move line UP
;; Ctrl + Shift + DOWN  => move line DOWN
(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))
(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))
(global-set-key [(control shift down)]  'move-line-down)
(global-set-key [(control shift up)]    'move-line-up)

;; Set THEME
;; and window LOOK
(load-theme 'kaolin-dark t)
(kaolin-treemacs-theme)
(set-frame-font "Inconsolata-12")
(set-face-foreground 'font-lock-doc-face "grey")
(set-face-foreground 'font-lock-comment-face "grey")
(xterm-mouse-mode 1)    ;; Enable mouse in terminal
(tool-bar-mode -1)      ;; Disable toolbar by default

;; TAB settings
;; Set tab
;; TODO: set to not use tab character!
(setq-default indent-tabs-mode nil)
(defun my-tab ()
  "Insert a tab char. (ASCII 9, \t)."
  (interactive)
  (insert "\t"))        ;; insert two spaces
(global-set-key [C-return] 'tab-to-tab-stop)
(setq-default tab-width 2)
(setq tab-width 2)

;; Nyan "CAT" mode
;; Put and animate
;; Nyan CAT
;; It's cute
(nyan-mode 1)
(use-package nyan-mode
   :custom
   (nyan-cat-face-number 4)
   (nyan-animate-nyancat t)
   (nyan-bar-length 20)
   :hook
   (doom-modeline-mode . nyan-mode))

;; crux
;; it helps open file with
;; system default application
(use-package crux
  :bind (("C-c o" . crux-open-with)
         ("C-a" . crux-move-beginning-of-line)))

;; Highlight TODO mode
;; This package highlight TODO items
;; and provide custom key bindings for it
(load "~/.emacs.d/hl-todo")
(global-hl-todo-mode)
;; (define-key hl-todo-mode-map (kbd "C-c p") 'hl-todo-previous)
;; (define-key hl-todo-mode-map (kbd "C-c n") 'hl-todo-next)
;; (define-key hl-todo-mode-map (kbd "C-c o") 'hl-todo-occur)
;; (define-key hl-todo-mode-map (kbd "C-c i") 'hl-todo-insert)

;; Compile command
;; Whenever I need to compile,
;; then use [C-c k] binding to run 'compile
(global-set-key "\C-ck" #'compile)

;; Company mode
;; Using company for global
;; autocompletion
(add-hook 'after-init-hook
          'global-company-mode)

;; auto completion with company
(eval-after-load 'company
  '(add-to-list 'company-backends
                'company-c-headers))

;; Use company-mode only
;; with company-go in go-mode
(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (company-mode)
            (local-set-key (kbd "M-.") 'godef-jump)
            (local-set-key (kbd "M-*") 'pop-tag-mark)))

;; (add-hook 'go-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'company-backends) '(company-gtags))))

;; GO MODE settings
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'after-save-hook
          (lambda ()
            (when (derived-mode-p 'go-mode)
              (shell-command-to-string "go install"))))

;; CEDET/Semantic mode enable
(semantic-mode 1)
(require 'semantic/bovine/c)
(semantic-add-system-include "/usr/include/gtk-3.0/" 'c-mode)

;; GGTAGS
(require 'ggtags)
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode
                                  'c++-mode
                                  'java-mode
                                  'asm-mode)
              (ggtags-mode 1))))

;; (add-hook 'go-mode-hook
;;           (lambda ()
;;             (when (derived-mode-p 'go-mode)
;;               (ggtags-mode 1)
;;               (setq ggtags-executable-directory "~/.emacs.d/bin/gtags"))))

(setq-local imenu-create-index-function
            #'ggtags-build-imenu-index)

(define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
(define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
(define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
(define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
(define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
(define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
(define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)

;; HELM-GTAGS mode
(require 'helm-gtags)
;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)
;; (add-hook 'go-mode-hook 'helm-gtags-mode)
(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
(define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

;; Global flycheck mode
;; I will use it almost everywhere
;; where possible
(global-flycheck-mode)

;; Flycheck GO Bugfix!
(let ((govet (flycheck-checker-get 'go-vet 'command)))
  (when (equal (cadr govet) "tool")
    (setf (cdr govet) (cddr govet))))

;; GDB Many windows set 1
(setq gdb-many-windows 1)
(defun run-development-mode ()
  "Demo message."
  (interactive)
  (message "Running GDB")
  (gdb "gdb -i=mi ./main")
  (tool-bar-mode 1))

(defun development-gdb-run ()
  "Run GDB run."
  (interactive)
  (gud-run 1))

(defun development-gdb-continue ()
  "Run GDB run."
  (interactive)
  (gud-cont 1))


(defun development-gdb-next ()
  "GDB next."
  (interactive)
  (gud-next 1))

(global-set-key (kbd "<f5>") 'run-development-mode)

(add-hook 'gdb-mode-hook
          (lambda ()
            (local-set-key (kbd "<f8>") 'development-gdb-run)
            (local-set-key (kbd "<f9>") 'development-gdb-continue)
            (local-set-key [C-f9] 'development-gdb-next)))

;; Travis-CI
;; Travis-CI TOKEN is set by git config --add build-status.api-token TOKEN

;; Insert licenses
(defconst mezeipetister-license-gpl2
  "Copyright (C) %s %s <%s>.
All rights reserved. License: GNU GPLv2.0.

Project A: an MVP project about publishing agri tech - mainly machines - information.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.")

(defun license-insert-gpl2 ()
  "Insert the GPL2 license header."
  (interactive)
  (progn
    (goto-char (point-min))
    (insert-before-markers-and-inherit (format mezeipetister-license-gpl2
                    (format-time-string "%Y" (current-time))
                    "Peter Mezei"
                    "github.com/mezeipetister"))
    ;; (fill-region-as-paragraph (point-min)
    ;;                           (- (point) 1))
    (comment-region (point-min) (point))
    (insert "\n")
    (goto-char (point-min))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)
;;; init.el ends here
