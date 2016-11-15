;; File tree manager

;; Adding remove linum mode to after changing mode hook
(add-hook 'after-change-major-mode-hook 'remove-linum-mode-of-nav-buffer)

;; Nav open file
(add-hook 'nav-mode-hook
          '(lambda()
             (local-set-key (kbd "o") 'nav-open-file-under-cursor)))
