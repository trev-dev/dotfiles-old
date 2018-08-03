;;; package --- Summary:

;;; Commentary:
"Use org to load config from ~/.dotfiles/emacs/configuration.org. First we'll need the org package. Use M-x install-package org if you do not already have it Ensure that all config files are in the correct dir. This .emacs file can then be symlinked to your home directory. Everything after ';;; emacs ends here' is auto-inserted by emacs via customize-variable. If you don't like those lazy configs just delete everything after the ends here line"

;;; Packages:
(require 'org)

"Load org config"
;;; Code:
(org-babel-load-file "~/.dotfiles/emacs/configuration.org")

(provide 'emacs)
;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js-indent-level 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
