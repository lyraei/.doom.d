;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;===============================
;; FIRST ORDER OF BUSINESS
;;===============================

(setq package-enable-at-startup nil
      inhibit-startup-message   t
      frame-resize-pixelwise    t  ; fine resize
      package-native-compile    t) ; native compile packages
(scroll-bar-mode -1)               ; disable scrollbar
(tool-bar-mode -1)                 ; disable toolbar
(tooltip-mode -1)                  ; disable tooltips
(set-fringe-mode 10)               ; give some breathing room
(menu-bar-mode -1)                 ; disable menubar
(blink-cursor-mode 0)              ; disable blinking cursor

(setq undo-limit        100000000
      auto-save-default t)
(setq window-combination-resize t) ; take new window space from all other window

;;===============================
;; PERSONAL INFO
;;===============================

(setq user-full-name       "Szymon Urban"
      user-real-login-name "lyarei"
      user-login-name      "lyraei"
      user-mail-address    "urbanszymon13@gmail.com")

;;===============================
;; LaTeX
;;===============================

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

;;===============================
;;
;;===============================

(setq auto-save-default t
      make-backup-files t)

(add-to-list 'auto-mode-alist '("\\.bash\\'" . sh-mode))

(setq shell-file-name (executable-find "bash"))

;;===============================
;; PROJECTS
;;===============================

(setq projectile-indexing-method 'alien)
(setq projectile-sort-order 'recentf)
(setq projectile-enable-caching t)
(setq projectile-files-cache-expire (* 60 60 24 14))
(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-per-project-compilation-buffer t)

(setq +project-scan-dir-paths
      '("~/main/Pisanie/"
        "~/main/Programy/"
        "~/main/Hardware/"
        "~/main/org/"
        ))

(setq org-directory "~/main/org/")

;;===============================
;; VISUAL
;;===============================

(setq doom-theme 'doom-gruvbox)

(setq doom-font (font-spec :family "Touchscreen" :size 16))
(setq doom-serif-font (font-spec :family "Larabiefont" :size: 14))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq display-line-numbers-type 'visual)
(setq scroll-margin 30)

(setq global-display-fill-column-indicator-mode t)

;;===============================
;; DIRVISH
;;===============================

;; TODO ALOT
(after! dirvish
  (setq! dirvish-quick-access-entries
         `(("h" "~/"                          "Home")
           ("e" ,user-emacs-directory         "Emacs user directory")
           ("c" "~/main/"                     "Code")
           ("d" "~/Downloads/"                "Downloads")
           ("m" "/mnt/"                       "Mounted drives")
           ("t" "~/.local/share/Trash/files/" "Trash"))))


;; (add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))
;;
;; (setq dired-kill-when-opening-new-dired-buffer t)
;;
;; (with-eval-after-load 'wdired
;;   (defvar wdired-mode-map)
;;   (define-key wdired-mode-map (kbd "C-c C-g") 'wdired-abort-changes)
;;   (defvar wdired-allow-to-change-permissions)
;;   (setq wdired-allow-to-change-permissions t))


;;===============================
;;
;;===============================

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
