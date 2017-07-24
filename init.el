;; init file tips:
;; http://a-nickels-worth.blogspot.com/2007/11/effective-emacs.html
;; http://sites.google.com/site/steveyegge2/effective-emacs

;; common lisp compatibility

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cl) 

(defvar *emacs-load-start* (current-time))

(defvar *my-default-lib* "~/.emacs.d/lib"
  "Vendor libraries that cannot be installed via the package system")
(defvar *my-conf* "~/.emacs.d/conf/"
  "My configurations")

(add-to-list 'load-path *my-default-lib*)
(add-to-list 'load-path *my-conf*)


(load "package-manager.el")
(load "misc.el")
(load "history.el")
(load "keybindings.el")
(load "ido-conf.el")
(load "autocompletion.el")
(load "eshell-conf.el")
(load "slime-conf.el")
(load "spell-checking.el")
(load "lisp-conf.el")
(load "scheme-conf.el")
(load "ruby-conf.el")
(load "js-conf.el")
(load "haskell-conf.el")
(load "google-maps.el")
(load "w3m.el")
(load "emms-conf.el")

(setq custom-file (concat *my-conf* "custom.el"))
(load custom-file 'noerror)


;; find out the time your emacs took to load.
;; (message "My .emacs loaded in %ds"
;;          (destructuring-bind (hi lo ms) (current-time)
;;            (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
