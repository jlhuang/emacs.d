(defun emacs-dired-open-file-in-external-app ()
  "Open the current file in external app.
   Works only in Mac OS X."
  (interactive)
  (when (string-equal system-type "darwin")
        (funcall (lambda (filename) (shell-command (format "open \"%s\"" filename)))
                 (dired-get-filename))))

(eval-after-load 'dired
  '(progn
     (require 'dired+)
     (put 'dired-find-alternate-file 'disabled nil)
     (setq dired-recursive-deletes 'top)
     (add-hook 'dired-mode-hook
               (lambda ()
                 (define-key dired-mode-map (kbd "^")
                   (lambda () (interactive) (find-alternate-file "..")))
                 (define-key dired-mode-map (kbd "o") 'emacs-dired-open-file-in-external-app) 
                 ))))

(provide 'init-dired)
