;;; tabby --- Modifies the tab bar to have pets!
;;;

;;; Author: Xavier Ruiz <xruizify@gmail.com>
;;; Version: 0.1

;;; This file is not currently part of GNU Emacs.

;;; This program is free software; you can redistribute it and/or
;;; modify it under the terms of the GNU General Public License as
;;; published by the Free Software Foundation; either version 2, or (at
;;; your option) any later version.

;;; This program is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.

;;; You should have received a copy of the GNU General Public License
;;; along with this program ; see the file COPYING.  If not, write to
;;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;;; Boston, MA 02111-1307, USA.

;;; Commentary:
;;; Ever wanted a pet in your tab bar?  Well, with the power of SVGs and tab-bar-mode magic, now you can!
;;; Choose from a variety of pets including:
;;; - cat
;;; - dog
;;; - robot
;;; This package requires Emacs 28 or higher, for the tab-bar-mode.

;;; In the future, there will be more pets added, but adding your own pet is also easy!
;;; Please see tabby-cat.el for an example of how to make a pet.

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
