
# Table of Contents

1.  [Get Repositories](#org1ac9123)
2.  [Emacs Config Changes](#org5023289)
    1.  [Layout & Indentation](#org4c08c3c)
    2.  [Font Config](#org2b75685)
    3.  [Empty Scratch](#org77b90a8)
3.  [Get & Configure 3rd Party Packages](#org7bb8e79)
    1.  [Use Package](#org72ba249)
    2.  [Ace Jump](#org889b042)
    3.  [All The Icons](#orge0b5b3e)
    4.  [Better Defaults](#org0f8ed22)
    5.  [Doom Family](#org2a27d58)
        1.  [Modeline](#org1c50da0)
        2.  [Themes](#org46ff82d)
    6.  [Emmet Mode](#orgd80ef47)
    7.  [Evil Mode](#org4113f5e)
    8.  [Expand Region (Disabled)](#org71b971a)
    9.  [Flycheck (Linting)](#org973a078)
    10. [Git Gutter (Diff-Hl)](#org72f0e17)
        1.  [Figure out how to get flydiff to work](#org0f4085b)
    11. [Helm](#org2211db4)
    12. [Magit](#org937aa1c)
    13. [Modes & Auto Completion](#org6006830)
        1.  [Company (Auto Complete)](#orgcd09341)
        2.  [Company-Tern](#orgd163027)
        3.  [Deferred](#orga482359)
        4.  [Jedi (Python)](#org3225bdf)
        5.  [JS2-Mode](#org5fa4c96)
        6.  [JS2-refactor](#orgf66bb18)
        7.  [Markdown-Mode](#org13d8463)
        8.  [Org Mode <3](#org8fa8e5d)
        9.  [Pug Mode](#org48d4598)
        10. [Python-Environment](#orgb6d950a)
        11. [RJSX-Mode](#org052e158)
        12. [SCSS/CSS](#orgb3bfc25)
        13. [Vue Mode](#orgac7f796)
        14. [Web-Mode](#org13b8a10)
        15. [Xref-JS2](#orga4178ff)
        16. [YAML Mode](#org8870dbb)
    14. [Rainbow Delimiters](#org93f07b4)
    15. [Rainbow Identifiers (Disabled)](#org9a6e295)
    16. [Smartparens](#orgbe83187)
    17. [Treemacs](#orgf5ea9aa)
    18. [Yasnippet](#org6cd8eac)


<a id="org1ac9123"></a>

# Get Repositories

    (require 'package)
    
    (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                             ("marmalade" . "https://marmalade-repo.org/packages/")
                             ("melpa" . "https://melpa.org/packages/")))
    
    (setq package-enable-at-startup nil)
    (package-initialize)


<a id="org5023289"></a>

# Emacs Config Changes


<a id="org4c08c3c"></a>

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


<a id="org2b75685"></a>

## Font Config

    (set-language-environment "UTF-8")
    (set-default-coding-systems 'utf-8)
    (add-to-list 'default-frame-alist '(font . "Fira Code Medium" ))
    (set-face-attribute 'default t :font "Fira Code Medium" )


<a id="org77b90a8"></a>

## Empty Scratch

    (setq initial-scratch-message "")


<a id="org7bb8e79"></a>

# Get & Configure 3rd Party Packages


<a id="org72ba249"></a>

## Use Package

The mother of all packages. Streamlines plugin installations and
config.

    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))
    
    (eval-when-compile
      (require 'use-package))


<a id="org889b042"></a>

## Ace Jump

"Easy Motion" for emacs

    (use-package ace-jump-mode
      :ensure t
      :bind ("C-'" . ace-jump-mode))


<a id="orge0b5b3e"></a>

## All The Icons

Icon support

    (use-package all-the-icons
      :ensure t
      :config
      (setq all-the-icons-color-icons t))


<a id="org0f8ed22"></a>

## Better Defaults

Better default emacs settings

    (use-package better-defaults
      :ensure t)


<a id="org2a27d58"></a>

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


<a id="org1c50da0"></a>

### Modeline

Modeline. Not sold on it yet, but it's nice enough

    (use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))


<a id="org46ff82d"></a>

### Themes

Doom Theme Bundle

    (use-package doom-themes
      :ensure t
      :init
      (setq doom-themes-enable-bold t
      doom-themes-enable-italic t)
            (load-theme 'doom-city-lights t))


<a id="orgd80ef47"></a>

## Emmet Mode

A must have for web development

    (use-package emmet-mode
      :ensure t
      :config
      (add-hook 'sgml-mode-hook 'emmet-mode)
      (add-hook 'css-mode-hook 'emmet-mode)
      (setq emmet-expand-jsx-className t))


<a id="org4113f5e"></a>

## Evil Mode

I am evil!

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
            "l" 'treemacs)))
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


<a id="org71b971a"></a>

## Expand Region (Disabled)

Disabled as we do not require this with evil-mode keeping for
reference in case I change my mind. Expand region visual selection
between braces and quotes

    ;; (use-package expand-region
    ;;   :ensure t
    ;;   :config
    ;;   (global-set-key (kbd "C-=") 'er/expand-region))


<a id="org973a078"></a>

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


<a id="org72f0e17"></a>

## Git Gutter (Diff-Hl)


<a id="org0f4085b"></a>

### TODO Figure out how to get flydiff to work

Nicest looking "git gutter." Flydiff-mode is broken though. When
paired with Magit it eventually starts failing.

    (use-package diff-hl
      :ensure t
      :config
      (global-set-key (kbd "C-c d") 'diff-hl-mode)
      (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
      (global-diff-hl-mode))


<a id="org2211db4"></a>

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


<a id="org937aa1c"></a>

## Magit

Amazing git repo management

    (use-package magit
      :ensure t
      :config
      (global-set-key (kbd "C-c g") 'magit-status))


<a id="org6006830"></a>

## Modes & Auto Completion


<a id="orgcd09341"></a>

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


<a id="orgd163027"></a>

### Company-Tern

    (use-package company-tern
      :ensure t
      :config
      (add-to-list 'company-backends 'company-tern)
      (add-hook 'js2-mode-hook (lambda ()
               (tern-mode)
               (company-mode)))
      (define-key tern-mode-keymap (kbd "M-.") nil)
      (define-key tern-mode-keymap (kbd "M-,") nil))


<a id="orga482359"></a>

### Deferred

Async elisp function support. Why did I install this?

1.  TODO : Figure out why I installed this

        (use-package deferred
          :ensure t)


<a id="org3225bdf"></a>

### Jedi (Python)

    (use-package company-jedi
        :ensure t
        :config
        (add-hook 'python-mode-hook 'jedi:setup))
    
    (defun my/python-mode-hook ()
      "Company back-end hook for jedi."
      (add-to-list 'company-backends 'company-jedi))
    
    (add-hook 'python-mode-hook 'my/python-mode-hook)


<a id="org5fa4c96"></a>

### JS2-Mode

    (use-package js2-mode
      :config
      (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
      ;; Better imenu
      (add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
      :ensure t)


<a id="orgf66bb18"></a>

### JS2-refactor

    (use-package js2-refactor
      :config
      (add-hook 'js2-mode-hook #'js2-refactor-mode)
      (js2r-add-keybindings-with-prefix "C-c C-r")
      (define-key js2-mode-map (kbd "C-k") #'js2r-kill)
      :ensure t)


<a id="org13d8463"></a>

### Markdown-Mode

    (use-package markdown-mode
      :ensure t
      :commands (markdown-mode gfm-mode)
      :mode (("README\\.md\\'" . gfm-mode)
             ("\\.md\\'" . markdown-mode)
             ("\\.markdown\\'" . markdown-mode))
      :init (setq markdown-command "multimarkdown"))


<a id="org8fa8e5d"></a>

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


<a id="org48d4598"></a>

### Pug Mode

Pug html templating, for those who don't know. Used to be called
Jade. I don't endorse pug anymore, I just have it buried in old
projects.

    (use-package pug-mode
      :ensure t)


<a id="orgb6d950a"></a>

### Python-Environment

Virtualenv support.

    (use-package python-environment
      :ensure t)


<a id="org052e158"></a>

### RJSX-Mode

React Development. Need I say more?

    (use-package rjsx-mode
      :ensure t
      :config
      (add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
    
      (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
      (add-to-list 'company-backends 'company-etags))


<a id="orgb3bfc25"></a>

### SCSS/CSS

    (use-package css-mode
      :ensure t
      :config
      (add-to-list 'company-backends 'company-css))


<a id="orgac7f796"></a>

### Vue Mode

*"It's as if Angular & React had sex."*
`Maximilian Schwarzmüller`

    (use-package vue-mode
      :ensure t
      :config
      (add-hook 'js-mode-hook #'tern-mode)
      (add-to-list 'vue-mode-hook #'tern-mode)
      (setq mmm-js-mode-exit-hook (lambda () (setq tern-mode nil)))
      (setq mmm-js-mode-enter-hook (lambda () (setq tern-mode t)))
      (setq mmm-submode-decoration-level 0))


<a id="org13b8a10"></a>

### Web-Mode

    (use-package web-mode
      :ensure t
      :config
      (add-to-list 'company-backends 'company-etags))
    
    (use-package json-mode
      :ensure t)


<a id="orga4178ff"></a>

### Xref-JS2

    (use-package xref-js2
      :config
      (define-key js-mode-map (kbd "M-.") nil)
      (add-hook 'js2-mode-hook (lambda ()
               (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))
      :ensure t)


<a id="org8870dbb"></a>

### YAML Mode

    (use-package yaml-mode
      :ensure t)


<a id="org93f07b4"></a>

## Rainbow Delimiters

Nice, colorful, matching brackets.

    (use-package rainbow-delimiters
      :ensure t
      :config
      (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


<a id="org9a6e295"></a>

## Rainbow Identifiers (Disabled)

Saving for later. Trying to make identifiers nice. This plugin by
default works better than color-identifiers, but it colors
literally everything with little rhyme or reason. Don't want to
hack this at the moment.


<a id="orgbe83187"></a>

## Smartparens

Auto-wraps text in brackets/quotes. 

    (use-package smartparens
      :ensure t
      :config
      (require 'smartparens-config)
      (smartparens-global-mode t)
      (use-package evil-smartparens
        :ensure t
        :config
        (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)))


<a id="orgf5ea9aa"></a>

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


<a id="org6cd8eac"></a>

## Yasnippet

Snippet support

    (use-package yasnippet
      :ensure t
      :config
      (yas-global-mode 1)
      (use-package yasnippet-snippets
        :ensure t)
      (yas-reload-all))

