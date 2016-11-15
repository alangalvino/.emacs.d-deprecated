;; Avoid eshell warnning
(setenv "PAGER" "cat")

;; Smart eshell
(setq eshell-highlight-prompt t)
(setq eshell-scroll-to-bottom-on-input t)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

;; Eshell trigger clear function and initialize
(defun my-shell-hook ()
  (exec-path-from-shell-initialize)
  (local-set-key (kbd "C-l") 'eshell-clear-buffer))

(add-hook 'eshell-mode-hook 'my-shell-hook)

;; Replace weird colors
(defun color-escape-replace (string)
  (replace-regexp-in-string "\^\[\\\[2K\^\[\\\[0G" "" string))

(add-hook 'eshell-preoutput-filter-functions 'color-escape-replace)

;; Eshell color
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-filter-apply)
(add-hook 'eshell-preoutput-filter-functions 'ansi-color-apply)
