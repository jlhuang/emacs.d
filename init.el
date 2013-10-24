;; -*- coding: utf-8 -*-
;(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'load-path user-emacs-directory)
(require 'init-benchmarking) ;;Measure startup time

;;----------------------------------------------------------------------------
;; Which functionality to enable (use t or nil for true and false)
;;----------------------------------------------------------------------------
(setq *spell-check-support-enabled* t)
(setq *is-a-mac* (eq system-type 'darwin))
(setq *is-carbon-emacs* (and *is-a-mac* (eq window-system 'mac)))
(setq *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)
(require 'init-exec-path) ;; Set up $PATH
(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-themes)
(require 'init-osx-keys)
(require 'init-gui-frames)
(require 'init-maxframe)
(require 'init-proxies)
(require 'init-dired)
(require 'init-isearch)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flymake)

(require 'init-recentf)
(require 'init-ido)
(require 'init-hippie-expand)
(require 'init-auto-complete)
(require 'init-yasnippet)       ;;add the init yasnippet
(require 'init-windows)
(require 'init-sessions)
(require 'init-fonts)
(require 'init-mmm)
(require 'init-growl)

(require 'init-editing-utils)

(require 'init-darcs)
(require 'init-git)

(require 'init-crontab)
(require 'init-textile)
(require 'init-markdown)
(require 'init-csv)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-sh)
(require 'init-php)
(require 'init-org)
(require 'init-nxml)
(require 'init-css)
(require 'init-haml)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-ruby-mode)
(require 'init-rails)

(require 'init-lisp)
(require 'init-slime)
(require 'init-clojure)
(require 'init-common-lisp)

(when *spell-check-support-enabled*
  (require 'init-flyspell))

(require 'init-marmalade)
(require 'init-misc)

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))


;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "init-custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)


;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

;;----------------------------------------------------------------------------
;; these are my settings for emacs
;;----------------------------------------------------------------------------

;; Mode line preferences
(setq
;; display the day and date in the mode line
      display-time-day-and-date t
;; use 24hr format
      display-time-24hr-format t
;; don't display the system load average
      display-time-default-load-average nil)
(display-time)

;; Local Variables:
(setq gdb-non-stop-setting nil)

;; rebinding the cua-set-rectangle-mark to C-c m
(global-set-key (kbd "C-c m") 'cua-set-rectangle-mark)

;; get emacs to recognize my bash alias
;; (setq shell-file-name "/bin/bash")
(setq shell-command-switch "-ic")

;; add the linum mode
(if (fboundp 'prog-mode)
        (add-hook 'prog-mode-hook '(lambda () (linum-mode t))))

;; do not display the menu bar
(menu-bar-mode -1)

;; highlight current line
(global-hl-line-mode t)

;; suppress the error message "ls does not support --dired"
(setq dired-use-ls-dired nil)

;; set fill column to 80
(setq-default fill-column 80)
;; turn on auto-fill mode to all text and prog buffers
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)

;; customize the mode line format(do not display minor mode name in mode line)
 (setq-default mode-line-format
       '("%e" mode-line-front-space mode-line-mule-info mode-line-client
             mode-line-modified mode-line-remote mode-line-frame-identification
             mode-line-buffer-identification "   " mode-line-position
             vc-mode "   " mode-name "   " mode-line-misc-info
             mode-line-end-spaces))

;; unset the key C-x f to avoid the trouble when using C-x C-f to open a file
;; inappropriate
(global-unset-key (kbd "\C-xf"))

;; customize key binding for switching other window
(global-set-key (kbd "\C-x\C-n") 'other-window)

(defun other-window-backward (&optional n)
  "select Nth preview window."
  (interactive "P")
  (other-window (- (prefix-numeric-value n))))

(global-set-key (kbd "\C-x\C-p") 'other-window-backward)

