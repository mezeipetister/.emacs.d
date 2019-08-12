;;; flycheck-cedet.el --- Flycheck CEDET integration  -*- lexical-binding: t -*-

;; Copyright (c) 2013 David Holm <david.holm@gmail.com>
;;
;; Author: David Holm <david.holm@gmail.com>
;; Keywords: convenience language tools
;; Version: 0.1
;; Package-Requires: ((flycheck "0.13") (dash "1.2") (emacs "24.1"))

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'dash)
(require 'flycheck)


;;;; EDE project support
(defun flycheck-cedet-get-ede-cpp-project (file)
  "Get EDE C/C++ project for FILE.
If FILE does not belong to an EDE C/C++ project, or if EDE is not present, this
function returns nil."
  (when (featurep 'ede)
    (let ((project (ede-current-project (expand-file-name file))))
      (when (ede-cpp-root-project-p project)
        project))))

(defun flycheck-cedet-get-ede-cpp-project-includes (project)
  "Get include paths from EDE C/C++ PROJECT."
  (when (ede-cpp-root-project-p project)
    (let* ((root-path (ede-project-root-directory project))
           (include-paths (oref project include-path)))
      (--map (expand-file-name it root-path) include-paths))))


;;;; Project helpers
(defun flycheck-cedet-get-cpp-includes (option-name file)
  "Construct a list of includes using OPTION-NAME for the specified FILE.
If FILE is associated with a supported project type and if it has a list of
include paths a list consisting of OPTION-NAME concatenated with each path
will be constructed."
  (--map (concat option-name it)
         (let ((ede-proj (flycheck-cedet-get-ede-cpp-project file)))
           (cond
            (ede-proj (flycheck-cedet-get-ede-cpp-project-includes ede-proj))))))

(defun flycheck-cedet-get-cpp-definitions (option-name file)
  "Construct a list of definitions using OPTION-NAME for the specified FILE.
If FILE is associated with a supported project type and if it has a list of
definitions a list consisting of OPTION-NAME concatenated with the name of the
definition followed by an optional =<value> will be constructed."
  (--map (let ((macro (car it))
               (value (cdr it)))
           (concat option-name macro
                   (unless (string= "" value)
                     (concat "=" value))))
         (let ((ede-proj (flycheck-cedet-get-ede-cpp-project file)))
           (cond
            (ede-proj (ede-preprocessor-map ede-proj))))))


(provide 'flycheck-cedet)
;;; flycheck-cedet.el ends here