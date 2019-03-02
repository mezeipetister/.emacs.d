(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(add-to-list 'load-path "~/.emacs.d/vendor/mu4e-multi")
;;(add-to-list 'load-path "~/.emacs.d/vendor/mu4e-alert")
(require 'mu4e)
;;(require 'mu4e-alert)
(require 'smtpmail)

;; mu4e context to manage refil and delete for different accounts
(setq mu4e-contexts
 '((make-mu4e-context
     :name "Gmail"
     :match-func (lambda (msg) (when msg
       (string-prefix-p "/Gmail" (mu4e-message-field msg :maildir))))
     :vars '(
       (mu4e-trash-folder . "/Gmail/[Gmail].Trash")
       (mu4e-refile-folder . "/Gmail/[Gmail].Archive")
       ))
   ,(make-mu4e-context
     :name "Gardenova"
     :match-func (lambda (msg) (when msg
       (string-prefix-p "/Gardenova" (mu4e-message-field msg :maildir))))
     :vars '(
       (mu4e-trash-folder . "/Gmail/[Gmail].Trash")
       (mu4e-refile-folder . "/Gmail/[Gmail].Archive")
     ))
   ))

;; New message allert
;; (use-package mu4e-alert
;;   :ensure t
;;   :after mu4e
;;   :init
;;   (setq mu4e-alert-interesting-mail-query
;;     (concat
;;      "flag:unread maildir:/Gardenova/INBOX "
;;      "OR "
;;      "flag:unread maildir:/Gmail/INBOX"
;;      ))
;;   (mu4e-alert-enable-mode-line-display)
;;   (defun gjstein-refresh-mu4e-alert-mode-line ()
;;     (interactive)
;;     (mu4e~proc-kill)
;;     (mu4e-alert-enable-mode-line-display)
;;     )
;;   (run-with-timer 0 60 'gjstein-refresh-mu4e-alert-mode-line)
;;   )

;; Now I set a list of 
(defvar my-mu4e-account-alist
  '(("Gmail"
     (mu4e-sent-folder "/Gmail/[Gmail].Sent Mail")
     (user-mail-address "mezeipetister@gmail.com")
     (smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 "mezeipetister@gmail.com" nil)))
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587)
     )
    ("Gardenova"
     (mu4e-sent-folder "/Gardenova/[Gmail].Sent Mail")
     (user-mail-address "peter.mezei@gardenova.hu")
     (smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil)))
     (smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 "peter.mezei@gardenova.hu" nil)))
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587)
     )
     ;; Include any other accounts here ...
    ))

;; (defun my-mu4e-set-account ()
;;   "Set the account for composing a message.
;;    This function is taken from: 
;;      https://www.djcbsoftware.nl/code/mu/mu4e/Multiple-accounts.html"
;;   (let* ((account
;;     (if mu4e-compose-parent-message
;;         (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
;;     (string-match "/\\(.*?\\)/" maildir)
;;     (match-string 1 maildir))
;;       (completing-read (format "Compose with account: (%s) "
;;              (mapconcat #'(lambda (var) (car var))
;;             my-mu4e-account-alist "/"))
;;            (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
;;            nil t nil nil (caar my-mu4e-account-alist))))
;;    (account-vars (cdr (assoc account my-mu4e-account-alist))))
;;     (if account-vars
;;   (mapc #'(lambda (var)
;;       (set (car var) (cadr var)))
;;         account-vars)
;;       (error "No email account found"))))
;; (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
