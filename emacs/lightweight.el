(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(setq package-enable-at-startup nil)
(package-initialize)

(global-linum-mode 1)
(global-hl-line-mode 1)
(global-visual-line-mode t)
(setq inhibit-startup-screen t)
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq css-indent-offset 2)
(setq js-indent-level 2)

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(add-to-list 'default-frame-alist '(font . "Source Code Pro Semibold" ))
(set-face-attribute 'default t :font "Source Code Pro Semibold" )

(setq initial-scratch-message "")

(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-auto-revert-mode)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package ace-jump-mode
  :ensure t
  :bind ("C-'" . ace-jump-mode))

(use-package better-defaults
  :ensure t)

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init))

(use-package doom-themes
  :ensure t
  :init
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
        (load-theme 'doom-city-lights t))

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

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (use-package evil-smartparens
    :ensure t
    :config
    (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)))

(use-package atom-one-dark-theme
:ensure t
)
