(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)


""""" Emacs Config Changes """""

;; Interface changes
(global-linum-mode 1)
(global-hl-line-mode 1)
(setq-default indent-tabs-mode nil)
(setq tab-width 2)
(setq inhibit-startup-screen t)

;; Font
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(add-to-list 'default-frame-alist '(font . "Fira Code Medium" ))
(set-face-attribute 'default t :font "Fira Code Medium" )
;; Makes *scratch* empty.
(setq initial-scratch-message "")

;; Kill annoying buffers
(setq-default message-log-max nil)
(kill-buffer "*Messages*")

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))


""""" Required Packages & Configs """""

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Better defaults

(use-package better-defaults
  :ensure t)

;; Expand region

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

;; Helm

(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-c h p" . helm-projectile)
         ("C-c h C-p s" . helm-projectile-switch-project)
         ("C-c a C-p" . projectile-mode))
  :init
  (require 'helm-config)
  :config
  (helm-mode 1)
  (use-package helm-projectile
    :ensure t))

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-deferred-git-apply-delay   0.5
          treemacs-file-event-delay           5000
          treemacs-file-follow-delay          0.2
          treemacs-follow-after-init          t
          treemacs-follow-recenter-distance   0.1
          treemacs-goto-tag-strategy          'refetch-index
          treemacs-indentation                2
          treemacs-indentation-string         " "
          treemacs-is-never-other-window      nil
          treemacs-no-png-images              nil
          treemacs-project-follow-cleanup     nil
          treemacs-persist-file               (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-after-file-follow nil
          treemacs-recenter-after-tag-follow  nil
          treemacs-show-hidden-files          t
          treemacs-silent-filewatch           nil
          treemacs-silent-refresh             nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-space-between-root-nodes   t
          treemacs-tag-follow-cleanup         t
          treemacs-tag-follow-delay           1.5
          treemacs-width                      35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;; (treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("C-x t s"   . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

"
(use-package neotree
  :ensure t
  :config
  (setq neo-theme 'icons))
"
;; All the icons

(use-package all-the-icons
  :ensure t
  :config
  (setq all-the-icons-color-icons t))


;; DOOM!
(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init))

(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t))

;; Magit
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-c g") 'magit-status))

;; Git Gutter

(use-package diff-hl
  :ensure t
  :config
  (global-set-key (kbd "C-c d") 'diff-hl-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (global-diff-hl-mode))

;; Linting
(use-package flycheck
  :ensure t
  :config
  (setq-default flycheck-disabled-checker 'javascript-jshint)
  (setq-default flycheck-disabled-checker 'json-jsonlist)
  (setq-default flycheck-disabled-checker 'javascript-eslint)
  (setq-default flycheck-javascript-eslint-executable "eslint-project-relative")
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
    (or (buffer-file-name) default-directory)
      "node_modules"))
      (eslint (and root
      (expand-file-name "node_modules/eslint/bin/eslint.js"
        root))))
      (when (and eslint (file-executable-p eslint))
    (setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (global-flycheck-mode)
  )

;; Rainbow delimiters

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Autopair

(use-package autopair
  :ensure t
  :config
  (autopair-global-mode))

;; Auto-complete

(use-package company
:ensure t
:config
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)
(setq company-backends
      '((company-files          ; files & directory
         company-keywords       ; keywords
         company-capf
         company-yasnippet
         )
        (company-abbrev company-dabbrev)
        ))
(global-company-mode t))

(use-package company-jedi
    :ensure t
    :config
    (add-hook 'python-mode-hook 'jedi:setup))

(defun my/python-mode-hook ()
  "Company back-end hook for jedi."
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)
;; File modes

(use-package js2-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; Better imenu
  (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
  :ensure t)

(use-package js2-refactor
  :config
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (js2r-add-keybindings-with-prefix "C-c C-r")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
  :ensure t)

(use-package xref-js2
  :config
  (define-key js-mode-map (kbd "M-.") nil)
  (add-hook 'js2-mode-hook (lambda ()
			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))

  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'company-backends 'company-etags))

(use-package company-tern
  :config
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda ()
			     (tern-mode)
			     (company-mode)))
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil)
  :ensure t)

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'company-backends 'company-etags))

(use-package json-mode
  :ensure t)

(use-package sass-mode
  :ensure t
  :config
  (add-to-list 'company-backends 'company-css))

(use-package deferred
  :ensure t)

(use-package python-environment
  :ensure t)

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))


;; Org Mode

(use-package org
  :ensure t
  :config
  (use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

;; Ace Jump

(use-package ace-jump-mode
  :ensure t
  :bind ("C-'" . ace-jump-mode))

;; Evil Mode
"
(use-package evil
  :ensure t
  :config
  (evil-mode t)
  (use-package evil-magit
      :ensure t)
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (evil-leader/set-key
      \"]\" 'next-buffer
      \"[\" 'previous-buffer
      \"l\" 'neotree-toggle)))
(add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd \"q\") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd \"I\") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd \"z\") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd \"R\") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd \"m\") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd \"c\") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd \"d\") 'neotree-delete-node)

      (define-key evil-normal-state-local-map (kbd \"s\") 'neotree-enter-vertical-split)
      (define-key evil-normal-state-local-map (kbd \"S\") 'neotree-enter-horizontal-split)

      (define-key evil-normal-state-local-map (kbd \"RET\") 'neotree-enter)))
"

(provide 'emacs)
;;; .emacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (doom-city-lights)))
 '(custom-safe-themes
   (quote
    ("a566448baba25f48e1833d86807b77876a899fc0c3d33394094cf267c970749f" default)))
 '(js-indent-level 2)
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (markdown-mode sass-mode json-mode web-mode company-tern rjsx-mode xref-js2 js2-refactor js2-mode company-jedi company autopair rainbow-delimiters flycheck magit doom-themes doom-modeline all-the-icons helm-projectile helm expand-region better-defaults use-package)))
 '(show-trailing-whitespace t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
