
# Table of Contents

1.  [Get Repositories](#orgcf5608d)
2.  [Emacs Config Changes](#org603d15b)
    1.  [Layout & Indentation](#org50c3b38)
    2.  [Font Config](#org0add891)
    3.  [Empty Scratch](#org2359db1)
    4.  [Other](#orga4c258b)
3.  [Get & Configure 3rd Party Packages](#orgcc05ef3)
    1.  [Use Package](#org40cb2df)
    2.  [Ace Jump](#org9a6dac3)
    3.  [All The Icons](#orgbf6cffc)
    4.  [Better Defaults](#org2b30be6)
    5.  [Doom Family](#org381117e)
        1.  [Modeline](#org0f7c523)
        2.  [Themes](#org1aa4b6f)
    6.  [Emmet Mode](#orgefc9927)
    7.  [Evil Mode](#orga092c5e)
    8.  [Expand Region (Disabled)](#org7ee5c93)
    9.  [Flycheck (Linting)](#orgd648a6f)
    10. [Git Gutter](#org08151b3)
    11. [Helm](#org1d53a75)
    12. [Magit](#org2bf89de)
    13. [Modes & Auto Completion](#orga3dd075)
        1.  [Company (Auto Complete)](#orgeed100d)
        2.  [Deferred](#org3243577)
        3.  [Jedi (Python)](#orgadba1df)
        4.  [JS2-Mode](#orge05515b)
        5.  [JS2-refactor](#orgd69083a)
        6.  [LSP](#org10be970)
        7.  [Markdown-Mode](#orgec87cf7)
        8.  [Org Mode <3](#org47fcb7b)
        9.  [Pug Mode](#orgc410ffe)
        10. [Python-Environment](#org6ab5c11)
        11. [RJSX-Mode](#org1e8f498)
        12. [SCSS/CSS](#org59fd42c)
        13. [Vue Mode](#orga5254f2)
        14. [Web-Mode](#org93a3052)
        15. [Xref-JS2](#org0fbc4df)
        16. [YAML Mode](#org2d3bc10)
    14. [Rainbow Delimiters](#orgaee9da3)
    15. [Treemacs](#org936ec3e)
    16. [Yasnippet](#orge7c7488)


<a id="orgcf5608d"></a>

# Get Repositories

    (require 'package)

    (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                             ("marmalade" . "https://marmalade-repo.org/packages/")
                             ("melpa" . "https://melpa.org/packages/")))

    (setq package-enable-at-startup nil)
    (package-initialize)


<a id="org603d15b"></a>

# Emacs Config Changes


<a id="org50c3b38"></a>

## Layout & Indentation

    (setq display-line-numbers-type 'relative)
    (global-display-line-numbers-mode)
    (global-hl-line-mode 1)
    (global-visual-line-mode t)
    (setq inhibit-startup-screen t)
    (setq-default show-trailing-whitespace t)
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
    (setq css-indent-offset 2)
    (setq js-indent-level 2)
    (electric-pair-mode 1)


<a id="org0add891"></a>

## Font Config

    (set-language-environment "UTF-8")
    (set-default-coding-systems 'utf-8)
    (add-to-list 'default-frame-alist '(font . "Source Code Pro Semibold" ))
    (set-face-attribute 'default t :font "Source Code Pro Semibold" )


<a id="org2359db1"></a>

## Empty Scratch

    (setq initial-scratch-message "")


<a id="orga4c258b"></a>

## Other

Some tweaks to built-ins that I enjoy. Namely, auto pairing and
code folding.

    (add-hook 'prog-mode-hook #'hs-minor-mode)
    (global-auto-revert-mode)


<a id="orgcc05ef3"></a>

# Get & Configure 3rd Party Packages


<a id="org40cb2df"></a>

## Use Package

The mother of all packages. Streamlines plugin installations and
config.

    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))

    (eval-when-compile
      (require 'use-package))


<a id="org9a6dac3"></a>

## Ace Jump

"Easy Motion" for emacs

    (use-package ace-jump-mode
      :ensure t
      :bind ("C-'" . ace-jump-mode))


<a id="orgbf6cffc"></a>

## All The Icons

Icon support

    (use-package all-the-icons
      :ensure t
      :config
      (setq all-the-icons-color-icons t))


<a id="org2b30be6"></a>

## Better Defaults

Better default emacs settings

    (use-package better-defaults
      :ensure t)


<a id="org381117e"></a>

## Doom Family

*"In the first age, in the first battle, when the shadows first*
*lengthened, one stood. Burned by the embers of Armageddon, his soul*
*blistered by the fires of Hell and tainted beyond ascension, he*
*chose the path of perpetual torment. In his ravenous hatred he found*
*no peace; and with boiling blood he scoured the Umbral Plains*
*seeking vengeance against the dark lords who had wronged him. He*
*wore the crown of the Night Sentinels, and those that tasted the*
*bite of his sword named him&#x2026; the Doom Slayer."*
&#x2026;Theming stuff


<a id="org0f7c523"></a>

### Modeline

Modeline. Not sold on it yet, but it's nice enough

    (use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))


<a id="org1aa4b6f"></a>

### Themes

Doom Theme Bundle

    (use-package doom-themes
      :ensure t
      :init
      (setq doom-themes-enable-bold t
      doom-themes-enable-italic t))


<a id="orgefc9927"></a>

## Emmet Mode

A must have for web development

    (use-package emmet-mode
      :ensure t
      :config
      (add-hook 'sgml-mode-hook 'emmet-mode)
      (add-hook 'css-mode-hook 'emmet-mode)
      (setq emmet-expand-jsx-className t))


<a id="orga092c5e"></a>

## Evil Mode

I am evil!

      (use-package evil
        :ensure t
        :config
        (evil-mode t)
        (use-package evil-magit
            :ensure t)
        (use-package evil-org
            :ensure t
            :after org
            :config
            (add-hook 'org-mode-hook 'evil-org-mode)
            (add-hook 'evil-org-mode-hook
            (lambda ()
                  (evil-org-set-key-theme)))
                  (require 'evil-org-agenda)
                  (evil-org-agenda-set-keys))
        (use-package evil-leader
          :ensure t
          :config
          (global-evil-leader-mode)
          (evil-leader/set-key
            "]" 'next-buffer
            "[" 'previous-buffer
            "l" 'treemacs))
        (use-package evil-surround
          :ensure t
          :config
          (global-evil-surround-mode 1)))
    ;;   (add-hook 'neotree-mode-hook
    ;;       (lambda ()
    ;;         (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
    ;;         (define-key evil-normal-state-local-map (kbd "I") 'neotree-hidden-file-toggle)
    ;;         (define-key evil-normal-state-local-map (kbd "z") 'neotree-stretch-toggle)
    ;;         (define-key evil-normal-state-local-map (kbd "R") 'neotree-refresh)
    ;;         (define-key evil-normal-state-local-map (kbd "m") 'neotree-rename-node)
    ;;         (define-key evil-normal-state-local-map (kbd "c") 'neotree-create-node)
    ;;         (define-key evil-normal-state-local-map (kbd "d") 'neotree-delete-node)

    ;;         (define-key evil-normal-state-local-map (kbd "s") 'neotree-enter-vertical-split)
    ;;         (define-key evil-normal-state-local-map (kbd "S") 'neotree-enter-horizontal-split)

    ;;         (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter))
    ;; )


<a id="org7ee5c93"></a>

## Expand Region (Disabled)

Disabled as we do not require this with evil-mode keeping for
reference in case I change my mind. Expand region visual selection
between braces and quotes

    ;; (use-package expand-region
    ;;   :ensure t
    ;;   :config
    ;;   (global-set-key (kbd "C-=") 'er/expand-region))


<a id="orgd648a6f"></a>

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


<a id="org08151b3"></a>

## Git Gutter

    (use-package git-gutter
      :ensure t
      :config
      (global-git-gutter-mode t)
      (global-set-key (kbd "C-x C-g") 'git-gutter)
      (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

      ;; Jump to next/previous hunk
      (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
      (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

      ;; Stage current hunk
      (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

      ;; Revert current hunk
      (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)
      (custom-set-variables
        '(git-gutter:update-interval 2)
        '(git-gutter:modified-sign "▍") ;; two space
        '(git-gutter:added-sign "▍")    ;; multiple character is OK
        '(git-gutter:deleted-sign "▍")))


<a id="org1d53a75"></a>

## Helm

Helm makes finding stuff a heck of a lot nicer, when paired with AG
especially. Requires system installation of the-silver-searcher.

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


<a id="org2bf89de"></a>

## Magit

Amazing git repo management

    (use-package magit
      :ensure t
      :config
      (global-set-key (kbd "C-c g") 'magit-status))


<a id="orga3dd075"></a>

## Modes & Auto Completion


<a id="orgeed100d"></a>

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
    (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
    (global-company-mode t))


<a id="org3243577"></a>

### Deferred

1.  TODO : Figure out why I installed this

        (use-package deferred
          :ensure t)


<a id="orgadba1df"></a>

### Jedi (Python)

    ;; (use-package company-jedi
    ;;     :ensure t
    ;;     :config
    ;;     (add-hook 'python-mode-hook 'jedi:setup))

    ;; (defun my/python-mode-hook ()
    ;;   "Company back-end hook for jedi."
    ;;   (add-to-list 'company-backends 'company-jedi))

    ;; (add-hook 'python-mode-hook 'my/python-mode-hook)


<a id="orge05515b"></a>

### JS2-Mode

    (use-package js2-mode
      :config
      (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
      ;; Better imenu
      (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
      :ensure t)


<a id="orgd69083a"></a>

### JS2-refactor

    (use-package js2-refactor
      :config
      (add-hook 'js2-mode-hook #'js2-refactor-mode)
      (js2r-add-keybindings-with-prefix "C-c C-r")
      (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
      :ensure t)


<a id="org10be970"></a>

### LSP

    (use-package lsp-mode
      :ensure t
      :config
      (use-package lsp-ui
        :ensure t
        :config
        (add-hook 'lsp-mode-hook 'lsp-ui-mode))
      (use-package lsp-vue
        :ensure t
        :config
        (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable))
      (use-package lsp-javascript-typescript
        :ensure t
        :config
        (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
        (add-hook 'js2-mode-hook #'lsp-javascript-typescript-enable)
        (add-hook 'rjsx-mode #'lsp-javascript-typescript-enable))
      (use-package lsp-python
        :ensure t
        :config
        (add-hook 'python-mode-hook #'lsp-python-enable)))


<a id="orgec87cf7"></a>

### Markdown-Mode

    (use-package markdown-mode
      :ensure t
      :commands (markdown-mode gfm-mode)
      :mode (("README\\.md\\'" . gfm-mode)
             ("\\.md\\'" . markdown-mode)
             ("\\.markdown\\'" . markdown-mode))
      :init (setq markdown-command "multimarkdown"))


<a id="org47fcb7b"></a>

### Org Mode <3

This amazingly well documented Org config is here because of org
mode. As well as some semblence of structure in my life.

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


<a id="orgc410ffe"></a>

### Pug Mode

Pug html templating, for those who don't know. Used to be called
Jade. I don't endorse pug anymore, I just have it buried in old
projects.

    (use-package pug-mode
      :ensure t)


<a id="org6ab5c11"></a>

### Python-Environment

Virtualenv support.

    (use-package python-environment
      :ensure t)


<a id="org1e8f498"></a>

### RJSX-Mode

React Development. Need I say more?

    (use-package rjsx-mode
      :ensure t
      :config
      (add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))

      (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
      (add-to-list 'company-backends 'company-etags))


<a id="org59fd42c"></a>

### SCSS/CSS

    (use-package css-mode
      :ensure t
      :config
      (add-to-list 'company-backends 'company-css))


<a id="orga5254f2"></a>

### Vue Mode

*"It's as if Angular & React had sex."*
`Maximilian Schwarzmüller`

    (use-package vue-mode
      :ensure t
      :config
      (setq mmm-submode-decoration-level 0))


<a id="org93a3052"></a>

### Web-Mode

    (use-package web-mode
      :ensure t
      :config
      (add-to-list 'company-backends 'company-etags))

    (use-package json-mode
      :ensure t)


<a id="org0fbc4df"></a>

### Xref-JS2

    (use-package xref-js2
      :config
      (define-key js-mode-map (kbd "M-.") nil)
      (add-hook 'js2-mode-hook (lambda ()
               (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
      :ensure t)


<a id="org2d3bc10"></a>

### YAML Mode

    (use-package yaml-mode
      :ensure t)


<a id="orgaee9da3"></a>

## Rainbow Delimiters

Nice, colorful, matching brackets.

    (use-package rainbow-delimiters
      :ensure t
      :config
      (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


<a id="org936ec3e"></a>

## Treemacs

Nerdtree on steroids

    (use-package treemacs
      :ensure t
      :defer t
      :init
      (with-eval-after-load 'winum
        (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
      :config
      (use-package treemacs-evil
        :ensure t)
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


<a id="orge7c7488"></a>

## Yasnippet

Snippet support

    (use-package yasnippet
      :ensure t
      :config
      (yas-global-mode 1)
      (use-package yasnippet-snippets
        :ensure t)
      (yas-reload-all))
