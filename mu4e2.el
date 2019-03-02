(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")
(add-to-list 'load-path "~/.emacs.d/vendor/mu4e-multi")
(require 'mu4e)
(require 'smtpmail)
(require 'mu4e-multi)

(setq mu4e-contexts
 '( ,(make-mu4e-context
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


(defvar my-mu4e-account-alist
  '(("Gmail"
     ;;(mu4e-maildir "~/Maildir/Gmail")
     (mu4e-drafts-folder "~/Maildir/Gmail/[Gmail].Drafts")
     (mu4e-sent-folder   "~/Maildir/Gmail/[Gmail].Sent Mail")
     (mu4e-trash-folder  "~/Maildir/Gmail/[Gmail].Trash")
     (mu4e-refile-folder "~/Maildir/Gmail/[Gmail].All Mail")
     (user-mail-address "mezeipetister@gmail.com")
     (user-full-name "Peter Mezei")
     (mu4e-compose-signature (concat
      "Peter Mezei\n"
      ""))
     (mue4-sent-messages-behavior 'delete)
     ;; (mu4e-maildir-shortcuts
     ;; ( ("/INBOX"               . ?i)
     ;; 	("/[Gmail].Sent Mail"   . ?s)
     ;; 	("/[Gmail].Trash"       . ?t)
     ;; 	("/[Gmail].All Mail"    . ?a)))
     (mu4e-get-mail-command "offlineimap")
     (mu4e-view-show-images t)
     (mu4e-view-image-max-width 100)
     (message-send-mail-function smtpmail-send-it)
     (starttls-use-gnutls t)
     (smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
     (smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 "mezeipetister@gmail.com" nil)))
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587)
     (message-kill-buffer-on-exit t))
    ("Gardenova"
     ;;(mu4e-maildir "~/Maildir/Gardenova")
     (mu4e-drafts-folder "~/Maildir/Gardenova/[Gmail].Drafts")
     (mu4e-sent-folder   "~/Maildir/Gardenova/[Gmail].Sent Mail")
     (mu4e-trash-folder  "~/Maildir/Gardenova/[Gmail].Trash")
     (mu4e-refile-folder "~/Maildir/Gardenova/[Gmail].All Mail")
     (user-mail-address "peter.mezei@gardenova.hu")
     (user-full-name "Peter Mezei")
     (mu4e-compose-signature (concat
      "Peter Mezei\n"
      "Gardenova"))
     (mue4-sent-messages-behavior 'delete)
     ;; (mu4e-maildir-shortcuts
     ;;  ( ("/INBOX"               . ?i)
     ;; 	("/[Gmail].Sent Mail"   . ?s)
     ;; 	("/[Gmail].Trash"       . ?t)
     ;; 	("/[Gmail].All Mail"    . ?a)))
     (mu4e-get-mail-command "offlineimap")
     (mu4e-view-show-images t)
     (mu4e-view-image-max-width 100)
     (message-send-mail-function smtpmail-send-it)
     (starttls-use-gnutls t)
     (smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)))
     (smtpmail-auth-credentials
      '(("smtp.gmail.com" 587 "peter.mezei@gardenova.hu" nil)))
     (smtpmail-default-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-server "smtp.gmail.com")
     (smtpmail-smtp-service 587)
     (message-kill-buffer-on-exit t))))

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

(global-set-key (kbd "C-x m") 'mu4e-multi-compose-new)
(mu4e-multi-enable)