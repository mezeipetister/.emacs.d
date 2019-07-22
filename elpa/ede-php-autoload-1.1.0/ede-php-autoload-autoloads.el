;;; ede-php-autoload-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ede-php-autoload" "ede-php-autoload.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ede-php-autoload.el

(autoload 'ede-php-autoload-proj-root "ede-php-autoload" "\
Auto-detect composer project root.

Return the parent directory of the current buffer file that contains a composer.json file.

\(fn)" nil nil)

(autoload 'ede-php-autoload-load "ede-php-autoload" "\
Return a `ede-php-autoload-project' for the provided directory.

DIR is the project directory.

ROOTPROJ is the parent project.  The PHP autoload project is not
intended to be a subproject, so this argument is ignored.

\(fn DIR &optional ROOTPROJ)" nil nil)

(eval-after-load 'ede '(ede-add-project-autoload (ede-project-autoload "php-autoload" :name "PHP AUTOLOAD" :file 'ede-php-autoload :proj-file "composer.json" :proj-root 'ede-php-autoload-proj-root :load-type 'ede-php-autoload-load :class-sym 'ede-php-autoload-project :new-p nil :safe-p t) 'unique))

(eieio-defclass-autoload 'ede-php-autoload-project '(ede-project eieio-instance-tracker) "ede-php-autoload" nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ede-php-autoload" '("ede-" "initialize-instance")))

;;;***

;;;### (autoloads nil "ede-php-autoload-composer" "ede-php-autoload-composer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ede-php-autoload-composer.el

(defconst ede-php-autoload-composer-file "composer.json" "\
File name for composer configuration.")

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ede-php-autoload-composer" '("ede-php-autoload-")))

;;;***

;;;### (autoloads nil "ede-php-autoload-mode" "ede-php-autoload-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ede-php-autoload-mode.el

(autoload 'ede-php-autoload-mode "ede-php-autoload-mode" "\
ede-php-autoload // Enable PHP tag loading using `ede-php-autoload-project'.

\\{ede-php-autoload-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "ede-php-autoload-semanticdb" "ede-php-autoload-semanticdb.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from ede-php-autoload-semanticdb.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ede-php-autoload-semanticdb" '("ede-php-autoload-")))

;;;***

;;;### (autoloads nil nil ("ede-php-autoload-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ede-php-autoload-autoloads.el ends here
