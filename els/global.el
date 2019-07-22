;; Open file/folder using the native os application!
(use-package crux
  :bind (("C-c o" . crux-open-with)
         ("C-a" . crux-move-beginning-of-line)))

;; Once this mode is enabled, the selected text is going to be rewritten
(delete-selection-mode 1)

(package-install 'autopair)
(autopair-global-mode)

;; Nyan "Cat" mode
(use-package nyan-mode
   :custom
   (nyan-cat-face-number 4)
   (nyan-animate-nyancat t)
   :hook
   (doom-modeline-mode . nyan-mode))
;; Nyan mode end

(setq-default fill-column 80)
(setq company-tooltip-align-annotations t)

;; (require 'unicode-fonts)
;; (unicode-fonts-setup)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; -------------------------------
;; | Line MOVE UP/DOWN           | 
;; | + Keyboard shortcut         |
;; -------------------------------

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
(global-set-key [(control shift up)]  'move-line-up)

;; END
