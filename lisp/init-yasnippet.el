(require 'yasnippet)

;; use YASnippet as a non-global minor mode
(yas-reload-all)
(add-hook 'prog-mode-hook
          '(lambda ()
             (yas-minor-mode)))

;; default TAB key is occupied by auto-complete
(global-set-key (kbd "C-c y") 'yas/expand)

(provide 'init-yasnippet)
