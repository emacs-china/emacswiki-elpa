;;; emacswiki-elpa.el --- Emacswiki ELPA             -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Xu Chunyang

;; Author: Xu Chunyang <mail@xuchunyang.me>
;; Package-Requires: ((package-build "0.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'package-build)
(require 'cl-lib)

(defconst emacswiki-elpa-pwd (file-name-directory (or load-file-name (buffer-file-name))))

(defun emacswiki-elpa-recipe-alist ()
  (let (list)
    (let ((db (expand-file-name "epkg.sqlite" emacswiki-elpa-pwd)))
      (url-copy-file "https://raw.githubusercontent.com/emacsmirror/epkgs/master/epkg.sqlite" db 'ok-if-already-exists)
      (with-temp-buffer
        (call-process "sqlite3" nil t nil
                      db "-separator" " " "select name, mirror_url from packages where class='wiki'")
        (setq list (read (concat "(" (buffer-string) ")")))))
    (cl-loop for (name url) on list by #'cddr
             collect `(,(intern name) :fetcher git :url ,url))))

(defun emacswiki-elpa ()
  (let ((package-build-working-dir (expand-file-name "working/" emacswiki-elpa-pwd))
        (package-build-archive-dir (expand-file-name "packages/" emacswiki-elpa-pwd))
        (package-build--recipe-alist (emacswiki-elpa-recipe-alist)))
    (package-build-all)))

(provide 'emacswiki-elpa)
;;; emacswiki-elpa.el ends here
