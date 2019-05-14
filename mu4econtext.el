(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(require 'smtpmail)

(setq mu4e-get-mail-command "offlineimap"
      mu4e-maildir (expand-file-name "~/.email")
      mu4e-update-interval 180
      message-kill-buffer-on-exit t
      mu4e-headers-skip-duplicates t
      mu4e-compose-signature-auto-include nil
      mu4e-view-show-images t
      mu4e-view-show-addresses t
      mu4e-attachment-dir "~/Downloads"
      mu4e-use-fancy-chars t
      mu4e-headers-auto-update t
      message-signature-file "~/.emacs.d/.signature"
      mu4e-compose-signature-auto-include nil
      mu4e-view-prefer-html t
      mu4e-compose-in-new-frame t
      mu4e-change-filenames-when-moving t
      message-send-mail-function 'smtpmail-send-it
      starttls-use-gnutls t
      smtpmail-stream-type 'starttls
      ;;mu4e-html2text-command "w3m -T text/html"
      )

(setq mu4e-context-policy 'pick-first)
(setq mu4e-compose-context-policy 'always-ask)
(setq mu4e-contexts
      (list
       (make-mu4e-context
    :name "personnel"
    :enter-func (lambda () (mu4e-message "Entering personal context"))
    :leave-func (lambda () (mu4e-message "Leaving personal context"))
    :match-func (lambda (msg)
              (when msg
            (mu4e-message-contact-field-matches
             msg '(:from :to :cc :bcc) "mail@xxx.com")))
    :vars '((user-mail-address . "mail@xxx.com")
        (user-full-name . "Mr Plouc")
        (mu4e-sent-folder . "/work/Sent")
        (mu4e-drafts-folder . "/work/Drafts")
        (mu4e-trash-folder . "/work/Trash")
        (mu4e-refile-folder . "/work/Archives")
        (smtpmail-queue-dir . "~/.email/gmail/queue/cur")
        (smtpmail-smtp-user . "mail@xxx.com")
        (smtpmail-starttls-credentials . (("mail.xxx.com" 587 nil nil)))
        (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
        (smtpmail-default-smtp-server . "mail.xxx.com")
        (smtpmail-smtp-server . "mail.xxx.com")
        (smtpmail-smtp-service . 587)
        (mu4e-sent-messages-behavior . sent)
        (mu4e-maildir-shortcuts . ( ("/work/INBOX"    . ?i)
                        ("/work/Sent"     . ?s)
                        ("/work/Trash"    . ?t)
                        ("/work/Archives" . ?a)
                        ("/work/Drafts"   . ?d)
                        ))))

       (make-mu4e-context
    :name "gmail"
    :enter-func (lambda () (mu4e-message "Entering gmail context"))
    :leave-func (lambda () (mu4e-message "Leaving gmail context"))
    :match-func (lambda (msg)
              (when msg
            (mu4e-message-contact-field-matches
             msg '(:from :to :cc :bcc) "xxx@gmail.com")))
    :vars '((user-mail-address . "xxx@gmail.com")
        (user-full-name . "Mr Plouc")
        (mu4e-sent-folder . "/gmail/[Gmail]/Messages envoy&AOk-s")
        (mu4e-drafts-folder . "/gmail/[Gmail]/Brouillons")
        (mu4e-trash-folder . "/gmail/[Gmail]/Corbeille")
        (mu4e-refile-folder . "/gmail/[Gmail]/Tous les messages")
        (smtpmail-queue-dir . "~/.email/gmail/queue/cur")
        (smtpmail-smtp-user . "xxx@gmail.com")
        (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
        (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
        (smtpmail-default-smtp-server . "smtp.gmail.com")
        (smtpmail-smtp-server . "smtp.gmail.com")
        (smtpmail-smtp-service . 587)
        (mu4e-sent-messages-behavior . delete)
        (mu4e-maildir-shortcuts . ( ("/gmail/INBOX"                        . ?i)
                        ("/gmail/[Gmail]/Messages envoy&AOk-s" . ?s)
                        ("/gmail/[Gmail]/Corbeille"            . ?t)
                        ("/gmail/[Gmail]/Tous les messages"    . ?a)
                        ("/gmail/[Gmail]/Brouillons"           . ?d)
                        ))))))

;; don't save messages to Sent Messages, Gmail/IMAP takes care of this

;;; Bookmarks
(setq mu4e-bookmarks
      `(
    ("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
    ("flag:unread" "new messages" ?n)
        ("date:today..now" "Today's messages" ?t)
        ("date:7d..now" "Last 7 days" ?w)
        ("mime:image/*" "Messages with images" ?p)
        ))

;; (require 'org-mu4e)
;; (setq org-mu4e-convert-to-html t)
