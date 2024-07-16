;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Szymon Urban"
      user-mail-address "urbanszymon13@gmail.com")

;; =====================
;; BASICS
;; =====================

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq auto-save-default t
      make-backup-files t)

(add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))
(setq shell-file-name (executable-find "zsh"))
(setq-default vterm-shell (executable-find "zsh"))
(setq-default explicit-shell-file-name (executable-find "zsh"))

(add-hook 'text-mode-hook 'visual-line-mode)

(setq display-line-numbers-type 'visual)
(setq scroll-margin 27)

(setq global-display-fill-column-indicator-mode t)


;; =====================
;; PROJECTS
;; =====================

(setq projectile-indexing-method 'alien)
(setq projectile-sort-order 'recentf)
(setq projectile-enable-caching t)
(setq projectile-files-cache-expire (* 60 60 24 14))
(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-per-project-compilation-buffer t)

(setq +project-scan-dir-paths
      '("~/Projects/Pisanie/"
        "~/Projects/Programy/"
        "~/Projects/Hardware/"
        "~/Projects/org/"
        ))

;; =====================
;; THEME
;; =====================

(setq doom-theme 'adwaita)

(setq doom-font (font-spec :family "AnonymicePro Nerd Font" :size 16))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; =====================
;; ORG
;; =====================

(setq org-directory "~/Projects/org/")

;; =====================
;; DIRED
;; =====================

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

(setq dired-kill-when-opening-new-dired-buffer t)

(with-eval-after-load 'wdired
  (defvar wdired-mode-map)
  (define-key wdired-mode-map (kbd "C-c C-g") 'wdired-abort-changes)
  (defvar wdired-allow-to-change-permissions)
  (setq wdired-allow-to-change-permissions t))

;; =====================
;; LaTeX
;; =====================

(add-hook! 'latex-mode-hook
  (setq TeX-engine 'auctex-latexmk) 99)

(setq TeX-auto-save t
      TeX-parse-self t)
(setq-default TeX-master nil)

(setq +latex-viewers '(pdf-tools zathura))

(setq auto-revert-interval 0.5)

(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)

(map! :after latex
      :map cdlatex-mode-map
      :localleader
      :desc "Insert math symbol"
      "i" #'cdlatex-math-symbol
      :desc "Begin environment"
      "e" #'cdlatex-environment)

;; =====================

;; =====================
