;; ====== Emacs file ======

;; My emacs config file
;; @autor = Alan Gomes Alvino, alangavino@gmail.com

;; ====== Functions ======

;; Fullscren on linux
(defun toggle-fullscreen (&optional f)
      (interactive)
      (let ((current-value (frame-parameter nil 'fullscreen)))
           (set-frame-parameter nil 'fullscreen
                                (if (equal 'fullboth current-value)
                                    (if (boundp 'old-fullscreen) old-fullscreen nil)
                                    (progn (setq old-fullscreen current-value)
                                           'fullboth)))))




;; ====== Plugins ======

;; Pyflake and pep8
(when (load "flymake" t)
 (defun flymake-pylint-init ()
   (let* ((temp-file (flymake-init-create-temp-buffer-copy
                      'flymake-create-temp-inplace))
          (local-file (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
         (list "pep8" (list "--repeat" local-file))))

 (add-to-list 'flymake-allowed-file-name-masks
              '("\\.py\\'" flymake-pylint-init)))

(defun my-flymake-show-help ()
  (when (get-char-property (point) 'flymake-overlay)
    (let ((help (get-char-property (point) 'help-echo)))
      (if help (message "%s" help)))))

(add-hook 'post-command-hook 'my-flymake-show-help)
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; Add path of the pdflatex, for my Snow Leopard
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))

;; Indented for org mode
(setq org-startup-indented t)

;; Add to load-path the plugins directory
(add-to-list 'load-path "~/.emacs.d/plugins/")

;; Load end run autopair mode
(load "autopair")
(autopair-global-mode)

;; Ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode t)

;; Autocomplete mode
(add-to-list 'load-path "~/.emacs.d/plugins/autocomplete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/autocomplete//ac-dict")
(ac-config-default)

;; ====== Gerenal configs ======

;; Space between code and and line number
(setq linum-format "%d ")

;; Delete selected text
(delete-selection-mode 1)

;; Turn on paren match hightlighting
(show-paren-mode 1)

;; Show column number
(column-number-mode 1)

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
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-?") 'help-command)
(global-set-key (kbd "M-?") 'mark-paragraph)
(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;Remove fringes
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(fringe-mode 0 nil (fringe)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

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

;; Load local config
(load "local")

;; ====== Graphical configs ======

;; Add to load path the solarized theme
;(add-to-list 'load-path "~/.emacs.d/themes/solarized/")

;; Load the color-theme plugin
;(require 'color-theme)

;; Loand and run the solarized theme
;(load "color-theme-solarized")
;(color-theme-solarized-dark)

;; Remove menu bar
(menu-bar-mode -1)

;; Remove toll bar
(tool-bar-mode -1)

;; Remove scroll bar
(toggle-scroll-bar -1)

;; ====== Emacs 24 ======

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized/")
;; (load-theme 'solarized-dark t)
