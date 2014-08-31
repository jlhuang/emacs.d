;; Enable flymake-mode for C++ files.
(add-hook 'c++-mode-hook 'flymake-mode)

(setq flymake-gui-warnings-enabled nil)

;; Stop flymake from breaking when ruby-mode is invoked by mmm-mode,
;; at which point buffer-file-name is nil
(eval-after-load 'flymake
  '(progn
     (require 'flymake-cursor)

     (global-set-key (kbd "C-c f") 'flymake-goto-next-error)

     (defun flymake-can-syntax-check-file (file-name)
       "Determine whether we can syntax check FILE-NAME.
        Return nil if we cannot, non-nil if we can."
       (if (and file-name (flymake-get-init-function file-name)) t nil))

       (defun flymake-cc-init ()
         (let* (;; Create temp file which is copy of current file
               (temp-file   (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
                ;; Get relative path of temp file from current directory
               (local-file  (file-relative-name temp-file (file-name-directory buffer-file-name))))

               ;; Construct compile command which is defined list.
               ;; First element is program name, "g++" in this case.
               ;; Second element is list of options.
               ;; So this means "g++ -Wall -Wextra -fsyntax-only tempfile-path"
               (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

     ;; Enable above flymake setting for C++ files(suffix is '.cpp')
     (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
     )
  )

(provide 'init-flymake)
