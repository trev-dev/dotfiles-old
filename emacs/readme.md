
# Table of Contents

1.  [Get Repositories](#org59b118a)
2.  [Emacs Config Changes](#org5b9aa5e)
    1.  [Layout & Indentation](#orgfdad6c2)
    2.  [Font Config](#org2897d39)
    3.  [Empty Scratch](#orgdd718dd)
3.  [Get & Configure 3rd Party Packages](#org980b9ee)
    1.  [Use Package](#org71b38b0)
    2.  [Better Defaults](#orgbf5e67b)
    3.  [Expand Region](#org6fe7792)
    4.  [Helm](#org135e179)
    5.  [Treemacs](#org1ee895a)
    6.  [Neotree (Disabled)](#orgba8c1aa)
    7.  [All The Icons](#org9f2a9d6)
    8.  [Doom Family](#orgd2b2c86)
        1.  [Modeline](#orgbfd1ee4)
        2.  [Themes](#org61bc917)
    9.  [Magit](#org0dbc0e5)
    10. [Git Gutter (Diff-Hl)](#orgcfd9433)
    11. [Flycheck (Linting)](#org3fa7972)
    12. [Rainbow Delimiters](#org201b3eb)
    13. [Autopair](#org0eb9f05)
    14. [Modes & Auto Completion](#orgcd162ea)
        1.  [Company (Auto Complete)](#org6d1e4d3)
        2.  [Jedi (Python)](#orgb03e1ba)
        3.  [JS2-Mode](#org721f49d)
        4.  [JS2-refactor](#orgf029ec4)
        5.  [Xref-JS2](#org9e8b00c)
        6.  [RJSX-Mode](#org2e75e90)
        7.  [Company-Tern](#org139c9dc)
        8.  [Web-Mode](#orgc3763fd)
        9.  [SCSS/CSS](#org664d6c7)
        10. [Deferred](#org180f9eb)
        11. [Python-Environment](#orgeb2a554)
        12. [Markdown-Mode](#org4e9f8cf)
        13. [Org Mode <3](#orge5da4b2)
        14. [YAML Mode](#org5f6f064)
    15. [Ace Jump](#orgf7a7897)
    16. [Evil Mode (Disabled)](#orgee47a44)


<a id="org59b118a"></a>

# Get Repositories

    (require 'package)
    
    (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                             ("marmalade" . "https://marmalade-repo.org/packages/")
                             ("melpa" . "https://melpa.org/packages/")))
    
    (setq package-enable-at-startup nil)
    (package-initialize)


<a id="org5b9aa5e"></a>

# Emacs Config Changes


<a id="orgfdad6c2"></a>

## Layout & Indentation

    (global-linum-mode 1)
    (global-hl-line-mode 1)
    (global-visual-line-mode t)
    (setq inhibit-startup-screen t)
    (setq-default show-trailing-whitespace t)
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
    (setq css-indent-offset 2)
    (setq js-indent-level 2)


<a id="org2897d39"></a>

## Font Config

    (set-language-environment "UTF-8")
    (set-default-coding-systems 'utf-8)
    (add-to-list 'default-frame-alist '(font . "Fira Code Medium" ))
    (set-face-attribute 'default t :font "Fira Code Medium" )


<a id="orgdd718dd"></a>

## Empty Scratch

    (setq initial-scratch-message "")


<a id="org980b9ee"></a>

# Get & Configure 3rd Party Packages


<a id="org71b38b0"></a>

## Use Package

    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
    
    (eval-when-compile
      (require 'use-package))


<a id="orgbf5e67b"></a>

## Better Defaults

    (use-package better-defaults
      :ensure t)


<a id="org6fe7792"></a>

## Expand Region

    (use-package expand-region
      :ensure t
      :config
      (global-set-key (kbd "C-=") 'er/expand-region))


<a id="org135e179"></a>

## Helm

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
      (custom-set-variables '(helm-follow-mode-persistent t))
      (use-package helm-projectile
        :ensure t)
      (use-package helm-ag
        :ensure t
        :bind (("C-c a g" . helm-do-ag)
               ("C-c a t" . helm-do-ag-this-file)
               ("C-c a p" . helm-do-ag-project-root)
               ("C-c a b" . helm-do-ag-buffers)
               ("C-c C-a p" . helm-projectile-ag))))


<a id="org1ee895a"></a>

## Treemacs

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


<a id="orgba8c1aa"></a>

## Neotree (Disabled)

(use-package neotree
  :ensure t
  :config
  (setq neo-theme 'icons))


<a id="org9f2a9d6"></a>

## All The Icons

    (use-package all-the-icons
      :ensure t
      :config
      (setq all-the-icons-color-icons t))


<a id="orgd2b2c86"></a>

## Doom Family

*"In the first age, in the first battle, when the shadows first lengthened, one stood. Burned by the embers of Armageddon, his soul blistered by the fires of Hell and tainted beyond ascension, he chose the path of perpetual torment. In his ravenous hatred he found no peace; and with boiling blood he scoured the Umbral Plains seeking vengeance against the dark lords who had wronged him. He wore the crown of the Night Sentinels, and those that tasted the bite of his sword named him&#x2026; the Doom Slayer."*


<a id="orgbfd1ee4"></a>

### Modeline

    (use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))


<a id="org61bc917"></a>

### Themes

    (use-package doom-themes
      :ensure t
      :init
      (setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
            (load-theme 'doom-city-lights t))


<a id="org0dbc0e5"></a>

## Magit

    (use-package magit
      :ensure t
      :config
      (global-set-key (kbd "C-c g") 'magit-status))


<a id="orgcfd9433"></a>

## Git Gutter (Diff-Hl)

    (use-package diff-hl
      :ensure t
      :config
      (global-set-key (kbd "C-c d") 'diff-hl-mode)
      (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
      (global-diff-hl-mode))


<a id="org3fa7972"></a>

## Flycheck (Linting)

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


<a id="org201b3eb"></a>

## Rainbow Delimiters

    (use-package rainbow-delimiters
      :ensure t
      :config
      (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


<a id="org0eb9f05"></a>

## Autopair

    (use-package autopair
      :ensure t
      :config
      (autopair-global-mode))


<a id="orgcd162ea"></a>

## Modes & Auto Completion


<a id="org6d1e4d3"></a>

### Company (Auto Complete)

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


<a id="orgb03e1ba"></a>

### Jedi (Python)

    (use-package company-jedi
        :ensure t
        :config
        (add-hook 'python-mode-hook 'jedi:setup))
    
    (defun my/python-mode-hook ()
      "Company back-end hook for jedi."
      (add-to-list 'company-backends 'company-jedi))
    
    (add-hook 'python-mode-hook 'my/python-mode-hook)


<a id="org721f49d"></a>

### JS2-Mode

    (use-package js2-mode
      :config
      (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
      ;; Better imenu
      (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
      :ensure t)


<a id="orgf029ec4"></a>

### JS2-refactor

    (use-package js2-refactor
      :config
      (add-hook 'js2-mode-hook #'js2-refactor-mode)
      (js2r-add-keybindings-with-prefix "C-c C-r")
      (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
      :ensure t)


<a id="org9e8b00c"></a>

### Xref-JS2

    (use-package xref-js2
      :config
      (define-key js-mode-map (kbd "M-.") nil)
      (add-hook 'js2-mode-hook (lambda ()
               (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
      :ensure t)


<a id="org2e75e90"></a>

### RJSX-Mode

    (use-package rjsx-mode
      :ensure t
      :config
      (add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
    
      (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
      (add-to-list 'company-backends 'company-etags))


<a id="org139c9dc"></a>

### Company-Tern

    (use-package company-tern
      :config
      (add-to-list 'company-backends 'company-tern)
      (add-hook 'js2-mode-hook (lambda ()
               (tern-mode)
               (company-mode)))
      (define-key tern-mode-keymap (kbd "M-.") nil)
      (define-key tern-mode-keymap (kbd "M-,") nil)
      :ensure t)


<a id="orgc3763fd"></a>

### Web-Mode

    (use-package web-mode
      :ensure t
      :config
      (add-to-list 'company-backends 'company-etags))
    
    (use-package json-mode
      :ensure t)


<a id="org664d6c7"></a>

### SCSS/CSS

    (use-package css-mode
      :ensure t
      :config
      (add-to-list 'company-backends 'company-css))


<a id="org180f9eb"></a>

### Deferred

    (use-package deferred
      :ensure t)


<a id="orgeb2a554"></a>

### Python-Environment

    (use-package python-environment
      :ensure t)


<a id="org4e9f8cf"></a>

### Markdown-Mode

    (use-package markdown-mode
      :ensure t
      :commands (markdown-mode gfm-mode)
      :mode (("README\\.md\\'" . gfm-mode)
             ("\\.md\\'" . markdown-mode)
             ("\\.markdown\\'" . markdown-mode))
      :init (setq markdown-command "multimarkdown"))


<a id="orge5da4b2"></a>

### Org Mode <3

    (use-package org
      :ensure t
      :config
      (setq org-agenda-files (append
      (file-expand-wildcards "~/Cloud/Orgs/*.org")))
      (use-package org-bullets
        :ensure t
        :config
        (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
      (use-package org-caldav
        :ensure t
        :config
        (setq org-caldav-url "https://cloud.trevdev.ca/remote.php/dav/calendars/trevdev")
        (setq org-caldav-calendar-id "org")
        (setq org-caldav-inbox "~/Cloud/Orgs/caldav.org")
        (setq org-caldav-files org-agenda-files)
        (setq org-icalendar-timezone "America/Vancouver"))
        (setq org-icalendar-alarm-time 1)
        (setq org-icalendar-include-todo t)
        (setq org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due))
        (setq org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo))
      (eval-after-load "org" '(require 'ox-md nil t))
      (use-package ox-gfm
        :ensure t
        :config
        (eval-after-load "org" '(require 'ox-gfm nil t)))
        (setq org-log-done 'time))


<a id="org5f6f064"></a>

### YAML Mode

    (use-package yaml-mode
      :ensure t)


<a id="orgf7a7897"></a>

## Ace Jump

    (use-package ace-jump-mode
      :ensure t
      :bind ("C-'" . ace-jump-mode))


<a id="orgee47a44"></a>

## Evil Mode (Disabled)

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
      "]" 'next-buffer
      "[" 'previous-buffer
      "l" 'neotree-toggle)))
(add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
      (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
      (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
      (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
      (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
      (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

(define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
(define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

(define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

