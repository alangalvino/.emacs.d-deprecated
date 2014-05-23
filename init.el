;; ======== Emacs file ========

;; My emacs config file
;; @autor = Alan Gomes Alvino, alangavino@gmail.com

;; ======== Functions ========

;; Fullscren on linux
(defun toggle-fullscreen (&optional f)
      (interactive)
      (let ((current-value (frame-parameter nil 'fullscreen)))
           (set-frame-parameter nil 'fullscreen
                                (if (equal 'fullboth current-value)
                                    (if (boundp 'old-fullscreen) old-fullscreen nil)
                                    (progn (setq old-fullscreen current-value)
                                           'fullboth)))))


;; Comment line or region
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))


;; Remove linum mode of the nav buffer
(defun remove-linum-mode-of-nav-buffer ()
  (unless (equal nil (string-match "*nav*" (buffer-name))) (linum-mode 0) nil)
  )

;; ======== Gerenal configs ========

;; Tab width
(setq-default indent-tabs-mode nil)

;; Adding remove linum mode to after changing mode hook
(add-hook 'after-change-major-mode-hook 'remove-linum-mode-of-nav-buffer)

;; Space between code and and line number
(setq linum-format "%d ")

;; Delete selected text
(delete-selection-mode 1)

;; Turn on paren match hightlighting
(show-paren-mode 1)

;; Show column number
(column-number-mode 1)

;; Refresh buffers
(global-auto-revert-mode t)

;; Show lines
(global-linum-mode 1)

;; Don't make backup file
(setq make-backup-files nil)

;; Don't make autosave file
(setq auto-save-default nil)

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Remove startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message t)

;; Enable clipboard copy and paste
(setq x-select-enable-clipboard t)

;; Global set keys
;(global-set-key (kbd "C-k") 'kill-whole-line)
;(global-set-key (kbd "C-?") 'help-command)
;(global-set-key (kbd "M-?") 'mark-paragraph)
;(global-set-key (kbd "C-h") 'delete-backward-char)
;(global-set-key (kbd "M-h") 'backward-kill-word)
;(global-set-key (kbd "C-x C-b") 'ido-display-buffer)
(global-set-key (kbd "C--") 'comment-or-uncomment-region-or-line)

;; Load system config
(add-to-list 'load-path "~/.emacs.d/system/")

;; Load misc config
(add-to-list 'load-path "~/.emacs.d/misc/")

(if (eq system-type 'darwin)
    (progn
      (load "mac")
      )
)

(if (eq system-type 'gnu/linux)
    (progn
      (load "linux")
      )
)

;; Load base config
(load "base")

;; Remove menu bar
(menu-bar-mode -1)

;; Remove toll bar
(tool-bar-mode -1)

;; Remove scroll bar
(toggle-scroll-bar -1)

;; Blink cursor mode
(setq blink-cursor-mode t)

;; ======== Emacs 24 ========

;; Load package, tromey and marmalade repositories
(require 'package)
(add-to-list 'package-archives
             '("elpa" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; Setup or install el-get if it's not installed
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

(setq el-get-sources
      '(
	(:name auto-complete
               :type git
	       :url "https://github.com/auto-complete/auto-complete.git"
	       :branch "1.3")
	(:name solarized-theme 
               :type elpa
	       :compile "solarized-theme")
	(:name expand-region
	       :type git
	       :url "https://github.com/magnars/expand-region.el/"
	       :compile "expand-region.el")
	(:name dirtree
	       :type git
	       :url "https://github.com/zkim/emacs-dirtree.git"
	       :compile "dirtree.el")
	(:name nxhtml
	       :type git
	       :url "https://github.com/emacsmirror/nxhtml.git"
	       :compile "autostart.el")
	)
      )

;; Packages to install
(setq my-packages 
      (append '(
		nav
		dirtree
		auto-complete
		solarized-theme
		autopair
		smooth-scroll
		markdown-mode
		expand-region
		nxhtml
		scala-mode2
		) 
	      (mapcar 'el-get-source-name el-get-sources))) 

(el-get 'sync my-packages)

;; Remove anoying message from emacsclient
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; ======== Initialize plugins ========

;; Adding plugin folder
(add-to-list 'load-path "~/.emacs.d/plugins/")

;;
(require 'dirtree)

;; Rinari
;; (require 'rinari)
;; (setq ruby-insert-encoding-magic-comment nil) ;; Remove auto commit on ruby files

;; Auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; Autopair
(require 'autopair)
(autopair-global-mode)

;; Ido mode
(require 'ido)
(ido-mode t)

;; Load Solarized
(require 'solarized-theme)
(load-theme 'solarized-dark t)

;; Load speed-bar same frame
;; (require 'sr-speedbar)

;; Smooth Scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Dirtree
(require 'tree-mode)
(require 'windata)
(require 'dirtree)

;; Ergonomic Emacs
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv") ; US Dvorak (Ergonomic)
(load "~/.emacs.d/plugins/ergoemacs-keybindings/ergoemacs-mode")
(ergoemacs-mode 1)

;; nXhtml
;; (load "~/.emacs.d/el-get/nxhtml/autostart.el")

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

;; Javascript
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

;; Open justo one window
(custom-set-variables '(pop-up-frames nil))
