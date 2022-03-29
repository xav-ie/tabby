;;; tabby-test --- Simple testing module for Tabby -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Xavier Ruiz

;; Author: Xavier Ruiz <xruizify@gmail.com>
;; Maintainer: Xavier Ruiz (xav-ie)
;; Keywords: tabs, tab-bar-mode, pets
;; Homepage: https://github.com/xav-ie/tabby/
;; Version: 0.1
;; Package-Requires: ((emacs "28"))

;; This file is not currently part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Testing module for Tabby.

;;; Code:
;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Display-Property.html
(require 'eieio)

(defun load-tabby ()
  "Load tabby.elc."
  (interactive)
  (byte-compile-file "/home/x/Projects/tabby/tabby.el")
  ;; add the tabby directory to the load path
  (if (member "/home/x/Projects/tabby" load-path) nil (push "/home/x/Projects/tabby" load-path))
  (declare-function tabby-make-pet "tabby")
  (declare-function tabby-menu-item "tabby")
  (require 'tabby)
  )

(defun test ()
  "Simple testing function."
  (load-tabby)
  (setq tab-bar-separator "")
  (setq tab-bar-close-button "")
  (setq tab-bar-tab-name-function #'(lambda () (concat " " (tab-bar-tab-name-current) " ")))

  ;; create a tabby pet
  (let ((pet1
	 (tabby-make-pet "/home/x/Downloads/corgi.gif")))
    (setq tab-bar-format
	  `(
	    single-separator
	    tabby-close-button
	    tabby-new-button
	    single-separator
	    tab-bar-format-tabs
	    ;;tab-bar-format-align-right
	    ,(lambda () (tabby-menu-item pet1))
	    )))
  tab-bar-format)



(provide 'tabby-test)
;;; tabby-test.el ends here
