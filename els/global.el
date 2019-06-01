;; Open file/folder using the native os application!
(use-package crux
  :bind (("C-c o" . crux-open-with)
         ("C-a" . crux-move-beginning-of-line)))

;; Once this mode is enabled, the selected text is going to be rewritten
(delete-selection-mode 1)

(package-install 'autopair)
(autopair-global-mode)

(setq-default fill-column 80)
(setq company-tooltip-align-annotations t)
