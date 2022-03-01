;;; tabby --- Modifies the tab bar to have pets!

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

;; Ever wanted a pet in your tab bar?  Well, with the power of SVGs and
;; tab-bar-mode magic, now you can!
;; Choose from a variety of pets including:
;; - cat
;; - dog
;; - robot
;;
;; This package requires Emacs 28 or higher, for the tab-bar-mode.
;;
;; In the future, there will be more pets added, but adding your own pet is
;; also easy!
;; Please see tabby-cat.el for an example of how to make a pet.

;;; Code:

(if (< emacs-major-version 28)
		(error "Emacs version >=28 is required as this package \
uses `tab-bar-mode' added in version 28"))

(defcustom tabby-doom-theme-fix nil
  "When t, modify the fonts in the tab-bar for a doom theme.
Doom themes often mess up the fonts in the tab bar.
Turn on this option to attempt to fix this."
  :group 'tabby
  :type 'boolean)

(defcustom tabby-keymap-prefix "C-c C-."
	"The prefix of tabby-mode bindings."
	:type 'string
	:group 'tabby)

(defcustom tabby-tips-on t
	"When t, the tabby pet will periodically show tips."
	:type 'boolean
	:group 'tabby)

(defcustom tabby-tips-timeout 30
	"The amount of time a tip is shown for.  Set to -1 for tips that never expire."
	:type 'number
	:group 'tabby)

(defcustom tabby-favorite-food "🧁"
	"Your tabby pet's favorite food.  It should be an emoji."
	:type 'string
	:group 'tabby)

(defvar tabby--hunger 10
	"How hungry your tabby pet is.  10 is full and 0 is hungry.")

(defvar tabby--hearts 0
	"How much your tabby pet loves you.
It is determined by how much you pet and feed your tabby.")

(defvar tabby--times-fed 0
	"How many times you have fed your tabby pet for this session.
You can feed up to a maximum of five times per session.")

(defun tabby-feed-pet ()
		"Feed your tabby pet their favorite food.
You may feed your tabby pet five times per session."
		(interactive)
		(setq tabby--times-fed (+ tabby--times-fed 1))
		(if (> tabby--times-fed 5)
				(error "You can only feed your tabby pet five times per session!")
			(setq tabby--hunger (+ tabby--hunger 1))
			)
		
		)

(defun tabby--key (KEY)
	"A macro for making keybinding with KEY for tabby-mode."
	(kbd (concat tabby-keymap-prefix " " KEY)))


;;;###autoload
(define-minor-mode tabby-mode
	"Toggles Tabby mode."
	:init-value nil
	:global t
	:group 'tabby
	:lighter " tabby"
	:keymap
	(list (cons (tabby--key "t") (lambda ()
																	(interactive)
																	(message "tabby mode binding used!"))))

	;; take action when enabled or disabled
	(if tabby-mode
			(message "tabby mode enabled!")
		(message "tabby mode disabled!"))

	)
(add-hook 'tabby-mode-hook (lambda () (message "tabby mode hook executed!")))
(add-hook 'tabby-mode-on-hook (lambda () (message "tabby mode turned on!")))
(add-hook 'tabby-mode-off-hook (lambda () (message "tabby mode turned off!")))
;;;###autoload


(provide 'tabby)
;;; tabby.el ends here

;; Probably don't want to mess with this...
(setq tab-bar-format
 '(tab-bar-format-history
				tab-bar-format-tabs
				tab-bar-separator
				tab-bar-format-add-tab
				))


(defun retstring ()
	"wooo")

(setq tab-bar-separator "")

(defun longstring ()
	(propertize "cat"
							'display (create-image "/home/x/.emacs.d/straight/repos/nyan-mode/img/nyan.xpm" 'xpm nil :ascent 'center)))

(setq tab-bar-format
			'(tab-bar-format-history
				tab-bar-format-tabs
				tab-bar-separator
				tab-bar-format-add-tab
				longstring
				tab-bar-format-align-right
				retstring))

;; max-image-size is a variable defined in ‘C source code’.
;; 
;; Its value is 10.0
;; 
;; Maximum size of images.
;; Emacs will not load an image into memory if its pixel width or
;; pixel height exceeds this limit.

;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Display-Property.html
