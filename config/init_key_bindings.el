;; General keybindings

;; Toggle fullscreen
(global-set-key (kbd "C-c f") 'toggle-frame-maximized)

;; Ergoemacs fixes
(global-set-key (kbd "M-e") 'delete-backward-char)
(global-set-key (kbd "C-SPC") 'set-mark-command)
(global-set-key (kbd "C--") 'comment-or-uncomment-region-or-line)

;; Text size
(global-set-key (kbd "C-x C--") 'text-scale-decrease)
(global-set-key (kbd "C-x C-+") 'text-scale-increase)
(global-set-key (kbd "C-x C-0") 'ergoemacs-text-scale-normal-size)

;;Eshell
(global-set-key (kbd "C-c s") 'eshell)

;; Helm
(global-set-key (kbd "M-a") 'helm-M-x)
(global-set-key (kbd "C-o") 'helm-find-files)

;; Nav
(global-set-key (kbd "C-c n") 'nav-toggle)

(add-hook 'nav-mode-hook
          '(lambda()
             (local-set-key (kbd "o") 'nav-open-file-under-cursor)))
