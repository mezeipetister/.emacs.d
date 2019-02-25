(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/Documents/"))

;;store org-mode links to messages
(require 'org-mu4e)
;;store link to message if in header view, not to header query
(setq org-mu4e-link-query-in-headers-mode nil)

(setq org-capture-templates
      '(("t" "Create Email Task" entry (file+headline "~/Documents/todo.org" "Email Tasks")
         "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))

(define-key mu4e-headers-mode-map (kbd "C-c c") 'org-mu4e-store-and-capture)
(define-key mu4e-view-mode-map    (kbd "C-c c") 'org-mu4e-store-and-capture)
