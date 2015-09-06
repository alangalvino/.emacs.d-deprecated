;; General keybindings

;; Toggle fullscreen
(global-set-key (kbd "M-RET") 'toggle-fullscreen)

;; Ergoemacs fixes
(global-set-key (kbd "C-SPC") 'set-mark-command)
(global-set-key (kbd "C--") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C--") 'text-scale-decrease)
(global-set-key (kbd "C-x C-+") 'text-scale-increase)
(global-set-key (kbd "C-x C-0") 'ergoemacs-text-scale-normal-size)
