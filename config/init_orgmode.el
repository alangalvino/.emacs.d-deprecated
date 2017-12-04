(defun my-notes-find ()
  (interactive)
  (let ((default-directory "~/.orgmode/notes/"))
    (helm-find-files nil)))

(setq org-default-notes-file "~/.orgmode/notes/inbox.org.gpg")

(setq org-agenda-files '("~/.orgmode/notes/inbox.org.gpg"
                         "~/.orgmode/notes/projects.org.gpg"
                         "~/.orgmode/notes/tickler.org.gpg"))

(setq org-capture-templates '(("t" "Todo [inbox]" entry
                               (file+headline "~/.orgmode/notes/inbox.org.gpg" "Tasks")
                               "* TODO %i%?")
                              ("n" "Notes [notes]" entry
                               (file+headline "~/.orgmode/notes/notes.org.gpg" "Notes")
                               "* %i%?")
                              ("T" "Tickler" entry
                               (file+headline "~/.orgmode/notes/tickler.org.gpg" "Tickler")
                               "* %i%? \n %U")))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda()
                           (org-bullets-mode 1)
                           (org-indent-mode 1)
                           (auto-fill-mode 1)                           
                           ))

;; Agenda
(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)

;; Refile
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)
                           ("~/gtd/someday.org" :level . 1)
                           ("~/gtd/tickler.org" :level . 1)))
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)

;; Org archive
(setq org-archive-location "./archive/%s_archive.gpg::* Archived Tasks")

;; Org babel
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ruby . t)
   (sh . t)))

(setq max-specpdl-size 10000)
(setq max-lisp-eval-depth 10000)

