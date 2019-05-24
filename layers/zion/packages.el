;;; packages.el --- zion layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2018 Sylvain Benner & Contributors
;;
;; Author:  <ly@archome>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `zion-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `zion/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `zion/pre-init-PACKAGE' and/or
;;   `zion/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst zion-packages
  '(
	posframe  ;; required by sdcv
	sdcv
	sphinx-doc)
  "The list of Lisp packages required by the zion layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun zion/init-posframe() 
   (use-package posframe :defer t) 
	 )

(defun zion/init-sdcv() 
  (use-package sdcv :defer t) 
  (setq sdcv-dictionary-simple-list        ;; a simple dictionary list
		'(
		  "牛津英汉双解美化版"
		  "Longman Dictionary of Contemporary English (4th Ed)"
		  "朗道英汉字典5.0"
		  "懒虫简明英汉词典"
		  "DrEye4in1词典"
		  ))
  (custom-set-variables
	'(sdcv-tooltip-timeout 60)
	)
  )

(defun zion/init-sphinx-doc() 

  (use-package sphinx-doc :defer t)
  (add-hook 'python-mode-hook 'sphinx-doc-mode)
    
	 )
;;; packages.el ends here
