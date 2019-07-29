;; Open file/folder using the native os application!
(use-package crux
  :bind (("C-c o" . crux-open-with)
         ("C-a" . crux-move-beginning-of-line)))

;; Once this mode is enabled, the selected text is going to be rewritten
(delete-selection-mode 1)

;; Autopair mode
(package-install 'autopair)
(autopair-global-mode)
;; End

;; Nyan "Cat" mode
(package-install 'nyan-mode)
(nyan-mode 1)
(use-package nyan-mode
   :custom
   (nyan-cat-face-number 4)
   (nyan-animate-nyancat t)
   (nyan-bar-length 20)
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

;; Artist mode hook
(add-hook 'artist-mode-hook
	  (lambda ()
	    ;; (local-set-key (kbd "<f1>") 'org-mode)
	    (local-set-key (kbd "<f2>") 'artist-select-op-pen-line) ; f2 = pen mode
            (local-set-key (kbd "<f3>") 'artist-select-op-line)     ; f3 = line
	    (local-set-key (kbd "<f4>") 'artist-select-op-square)   ; f4 = square
	    (local-set-key (kbd "<f5>") 'artist-select-op-rectangle)  ; f5 = rectangle
      (local-set-key (kbd "<f6>") 'artist-select-op-ellipse)  ; f5 = ellipse
	    ;; (local-set-key (kbd "C-z") 'undo)
      ))

;; END
