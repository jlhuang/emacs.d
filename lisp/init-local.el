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

(provide 'init-local)
