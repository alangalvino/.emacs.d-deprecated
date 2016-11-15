; List packages
(setq package-list '(exec-path-from-shell
                     solarized-theme
                     ergoemacs-mode
                     autopair
                     helm
                     nav))

; List repositories
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; Initialize packages
(package-initialize)

; Fetch available packages
(unless package-archive-contents
  (package-refresh-contents))

; Install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
