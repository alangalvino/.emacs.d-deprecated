;; ====== Emacs file ======


;; My emacs config file
;; @autor = Alan Gomes Alvino, alangavino@gmail.com

;; ====== Functions ======

;; Move line down function
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (next-line)
      (transpose-lines 1))
    (next-line)
    (move-to-column col)))

;; Vsplit
(defun vsplit ()
  (interactive)
  (split-window-horizontally)
  (ido-find-file)
)

;; Kill the buffer and the window
(defun kill-buffer-and-window ()
  (interactive)
  (ido-kill-buffer)
  (delete-window)
)

;; Move line up function
(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (next-line)
      (transpose-lines -1))
    (move-to-column col)))

;; Duplicate the current line
(defun duplicate-current-line ()
  (interactive)
  (beginning-of-line nil)
  (let ((b (point)))
    (end-of-line nil)
    (copy-region-as-kill b (point)))
  (beginning-of-line 2)
  (open-line 1)
  (yank)
  (back-to-indentation))

;; Meta key as Command on Mac
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'command)

;; Super key as Meta
(setq x-super-keysym 'meta)

;; ===== General configs  =====

;; Copy to clipboard
(setq x-select-enable-clipboard t)

;; Ergonomic emacs
(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "dv")
(load "~/.emacs.d/ergoemacs-keybindings-5.3.9/ergoemacs-mode")
(ergoemacs-mode 1)

;; Display Lines on mode line
(setq line-number-mode t)

;; Display colums on model line
(setq column-number-mode t)

;; Plugins path
(add-to-list 'load-path "~/.emacs.d/plugins/")

;; Markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) (setq auto-mode-alist (cons '("\\.text" . markdown-mode) auto-mode-alist))

;;YASnippet
(require 'yasnippet-bundle)

;; Autopair
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers
(setq autopair-autowrap t)

;; Git from git-emacs
(add-to-list 'load-path "~/.emacs.d/plugins/git-emacs-1.4.3")
(require 'git-emacs)

;; Autocomplete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-1.3.1/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete-1.3.1/ac-dict")
(ac-config-default)

;; Cua mode
(cua-mode t)
(setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
(transient-mark-mode 1) ;; No region when it is not highlighted
(setq cua-keep-region-after-copy t) ;; Standard Windows behaviour

;; Delete section when type
;;(delete-selection-mode 1)

;; Archives with same names in different buffers
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Ido mode
(require 'ido)
(ido-mode t)

;; Haskell mode
(load "~/.emacs.d/plugins/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Remove startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq inhibit-startup-echo-area-message t)

;; Don't make backup file
(setq make-backup-files nil)

;; Clean whitespaces
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Load the system PATH variable for MacOS
(if (eq system-type 'darwin)
    (setq exec-path (append exec-path '("/usr/local/git/bin")) )
)

;; Global set key
(global-set-key (kbd "C-c l") 'goto-line)
(global-set-key (kbd "C-c r") 'kill-whole-line)
(global-set-key (kbd "M-<down>") 'move-line-down)
(global-set-key (kbd "M-<up>") 'move-line-up)
(global-set-key (kbd "C-c g") 'beginning-of-buffer)
(global-set-key (kbd "C-c C-g") 'end-of-buffer)
(global-set-key (kbd "C-c  d") 'duplicate-current-line)
(global-set-key (kbd "C-x C-v") 'vsplit)
(global-set-key (kbd "M-RET") 'ns-toggle-fullscreen)
(global-set-key (kbd "C-x k") 'kill-buffer-and-window)
(global-set-key (kbd "C-x C-k") 'kill-buffer-and-window)
(put 'downcase-region 'disabled nil)

;; ====== Graphical configs ======

;; Scroll Setup
'(mouse-wheel-progressive-speed nil)
'(mouse-wheel-scroll-amount (quote (2 ((shift) . 1) ((control)))))

;; Remove menu bar
(menu-bar-mode -1)

;; Remove toll bar
(tool-bar-mode -1)

;; Remove scroll bar
(toggle-scroll-bar -1)

;; Color theme directory
(add-to-list 'load-path "~/.emacs.d/color-theme/")
(require 'color-theme)
(color-theme-initialize)

;; Color-theme-desert
;; (color-theme-desert)

;; Color-theme-solarized
(add-to-list 'load-path "~/.emacs.d/color-theme/themes/emacs-color-theme-solarized/")
(require 'color-theme-solarized)
(color-theme-solarized-dark)


;; Transparent
;; (set-frame-parameter (selected-frame) 'alpha '(100 100))
;; (add-to-list 'default-frame-alist '(alpha 90 100))

;; Highlight the current line
;; (global-hl-line-mode 1)

;; To customize the current line  background color
;; (set-face-background 'hl-line "#330")  ;; Emacs 22 Only1

;; Full Screen
;; (ns-toggle-fullscreen)
;; (set-frame-parameter nil 'fullscreen 'fullboth)