(eval-after-load 'dired
  '(progn
     (require 'dired+)
     (put 'dired-find-alternate-file 'disabled nil)
     (setq dired-recursive-deletes 'top)
     ;;(define-key dired-mode-map [mouse-2] 'dired-find-file)
     (add-hook 'dired-mode-hook
               (lambda ()
                 (define-key dired-mode-map (kbd "^")
                   (lambda () (interactive) (find-alternate-file "..")))))))

(provide 'init-dired)
