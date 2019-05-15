(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
;;(add-to-list 'load-path "~/.emacs.d/vendor/mu4e-multi")
(require 'mu4e)
(require 'smtpmail)

;; Bookmarks
(add-to-list 'mu4e-bookmarks
  (make-mu4e-bookmark
    :name  "Flagged messages"
    :query "flag:flagged"
    :key ?f))

(add-to-list 'mu4e-bookmarks
  (make-mu4e-bookmark
    :name  "INBOX"
    :query "maildir:\"/Gardenova/INBOX\" OR maildir:\"/Gmail/INBOX\""
    :key ?i))

(setq mu4e-sent-folder "/Gmail/[Gmail].Sent Mail"
      mu4e-drafts-folder "/Gmail/[Gmail].Drafts"
      mu4e-trash-folder  "/Gmail/[Gmail].Trash"
      mu4e-refile-folder "/Gmail/[Gmail].All Mail"
      user-mail-address "mezeipetister@gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-local-domain "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-stream-type 'starttls
      smtpmail-smtp-service 25
      mu4e-get-mail-command "offlineimap"
      mu4e-sent-messages-behavior 'delete
      mu4e-view-show-images t
      mu4e-view-image-max-width 100
      starttls-use-gnutls t)

(setq mu4e-contexts
      `( ,(make-mu4e-context
	  :name "private"
	  :enter-func (lambda () (mu4e-message "Entering Gmail context"))
	  :leave-func (lambda () (mu4e-message "Leaving Gmail context"))
	  :match-func (lambda (msg)
			(when msg
			  (string-match-p "^/Gmail" (mu4e-message-field msg :maildir))))
	  :vars '((user-mail-address	. "mezeipetister@gmail.com")
		  (mu4e-drafts-folder	. "/Gmail/[Gmail].Drafts")
		  (mu4e-sent-folder	. "/Gmail/[Gmail].Sent Mail")
		  (mu4e-trash-folder	. "/Gmail/[Gmail].Trash")
		  (mu4e-refile-folder	. "/Gmail/[Gmail].All Mail")
		  (user-full-name	. "Peter Mezei")
		  (mu4e-compose-signature . (concat
					   "Peter Mezei\n"
					   "+36304375490\n"
					   ""))
		  ))
	,(make-mu4e-context
	 :name "work"
	 :enter-func (lambda () (mu4e-message "Entering Gardenova context"))
	 :leave-func (lambda () (mu4e-message "Leaving Gardenova context"))
	 :match-func (lambda (msg)
			(when msg
			  (string-match-p "^/Gardenova" (mu4e-message-field msg :maildir))))
	 :vars '((user-mail-address	. "peter.mezei@gardenova.hu")
		 (mu4e-drafts-folder	. "/Gardenova/[Gmail].Drafts")
		 (mu4e-sent-folder	. "/Gardenova/[Gmail].Sent Mail")
		 (mu4e-trash-folder	. "/Gardenova/[Gmail].Trash")
		 (mu4e-refile-folder	. "/Gardenova/[Gmail].All Mail")
		 (user-full-name	. "Peter Mezei")
		 (mu4e-compose-signature . (concat
					  "Peter Mezei\n"
					  "Gardenova\n"
					  "+36304375490\n"
					  ""))
		 )
	 )))

;; (defvar my-mu4e-account-alist
;;   '(("Gmail"
;;      (mu4e-drafts-folder "/Gmail/[Gmail].Drafts")
;;      (mu4e-sent-folder   "/Gmail/[Gmail].Sent Mail")
;;      (mu4e-trash-folder  "/Gmail/[Gmail].Trash")
;;      (mu4e-refile-folder "/Gmail/[Gmail].All Mail")
;;      (user-mail-address "mezeipetister@gmail.com")
;;      (user-full-name "Peter Mezei")
;;      (mu4e-compose-signature (concat
;;       "Peter Mezei\n"
;;       ""))
;;      (smtpmail-smtp-user "mezeipetister")
;;      (smtpmail-default-smtp-server "smtp.gmail.com")
;;      (smtpmail-smtp-server "smtp.gmail.com")
;;      (smtpmail-smtp-service 587))
;;     ("Gardenova"
;;      (mu4e-drafts-folder "/Gardenova/[Gmail].Drafts")
;;      (mu4e-sent-folder   "/Gardenova/[Gmail].Sent Mail")
;;      (mu4e-trash-folder  "/Gardenova/[Gmail].Trash")
;;      (mu4e-refile-folder "/Gardenova/[Gmail].All Mail")
;;      (user-mail-address "peter.mezei@gardenova.hu")
;;      (user-full-name "Peter Mezei")
;;      (mu4e-compose-signature (concat
;;       "Peter Mezei\n"
;;       "Gardenova"))
;;      (smtpmail-smtp-user "peter.mezei@gardenova.hu")
;;      (smtpmail-default-smtp-server "smtp.gmail.com")
;;      (smtpmail-smtp-server "smtp.gmail.com")
;;      (smtpmail-smtp-service 587)
;;      )))

;; (defun my-mu4e-set-account ()
;;   "Set the account for composing a message."
;;   (let* ((account
;;           (if mu4e-compose-parent-message
;;               (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
;;                 (string-match "/\\(.*?\\)/" maildir)
;;                 (match-string 1 maildir))
;;             (completing-read (format "Compose with account: (%s) "
;;                                      (mapconcat #'(lambda (var) (car var))
;;                                                 my-mu4e-account-alist "/"))
;;                              (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
;;                              nil t nil nil (caar my-mu4e-account-alist))))
;;          (account-vars (cdr (assoc account my-mu4e-account-alist))))
;;     (if account-vars
;;         (mapc #'(lambda (var)
;;                   (set (car var) (cadr var)))
;;               account-vars)
;;       (error "No email account found"))))

;; (add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
