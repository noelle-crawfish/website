;;; build-site.el --- build script for website -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024
;;
;; Author:  <noelle@mycotoxin>
;; Maintainer:  <noelle@mycotoxin>
;; Created: May 18, 2024
;; Modified: May 18, 2024
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/noelle/build-site
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

(require `ox-publish)

(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :base-directory "./src"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :with-toc nil
             :section-numbers nil
             :timestamp nil
             )))


(setq org-html-validation-link nil)

;; generates the site output
(org-publish-all t)

;; (provide 'build-site)
;;; build-site.el ends here
