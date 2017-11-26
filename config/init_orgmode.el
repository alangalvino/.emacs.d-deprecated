(defun my-org-mode-hook()
  (progn
    (auto-fill-mode 1)))
(add-hook 'org-mode-hook 'my-org-mode-hook)

(defun my-notes-find ()
  (interactive)
  (let ((default-directory "~/.org-notes/"))
    (helm-find-files nil)))

(setq org-capture-templates '(
    ("j" "Journal Entry"
         entry (file+datetree "~/journal.org")
         "* Event: %?\n\n  %i\n\n  From: %a"
         :empty-lines 1)
))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1) (org-indent-mode 1)))
