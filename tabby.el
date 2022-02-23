;;; tabby --- Modifies the tab bar to have pets!

;; Copyright (C) 2022 Xavier Ruiz

;; Author: Xavier Ruiz <xruizify@gmail.com>
;; Maintainer: Xavier Ruiz (xav-ie)
;; Keywords: tabs, tab-bar-mode, pets
;; Homepage: https://github.com/xav-ie/tabby/
;; Version: 0.1
;; Package-Requires: ((emacs "28.1"))

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

;; Ever wanted a pet in your tab bar?  Well, with the power of SVGs and tab-bar-mode magic, now you can!
;; Choose from a variety of pets including:
;; - cat
;; - dog
;; - robot
;; This package requires Emacs 28 or higher, for the tab-bar-mode.
;;
;; In the future, there will be more pets added, but adding your own pet is also easy!
;; Please see tabby-cat.el for an example of how to make a pet.

;;; Code:

(require 'cl-lib)

(setq tab-bar-format
 '(tab-bar-format-history
				tab-bar-format-tabs
				tab-bar-separator
				tab-bar-format-add-tab
				))

(provide 'tabby)
;;; tabby.el ends here
