;; General Emacs configs

;; Loading Customize default before personal configs
(setq custom-file (locate-user-emacs-file "custom.el"))

;; Don't make backup file
(setq make-backup-files nil)

;; Don't make autosave file
(setq auto-save-default nil)

;; Enable clipboard copy and paste
(setq x-select-enable-clipboard t)

;; Delete selected text
(delete-selection-mode 1)

;; Refresh buffers
(global-auto-revert-mode t)

;; Turn on paren match hightlighting
(show-paren-mode 1)

;; Space between code and and line number
(setq linum-format "%d")

;; Show column number
(column-number-mode 1)

;; Show lines
;; (global-linum-mode 1)

;; Blink cursor mode
(setq blink-cursor-mode t)

;; Set font to Inconsolata if exists
(if (font-exists-p "Inconsolata") (set-default-font "Inconsolata-17"))

;; Forcing scratch message to nil
(setq initial-scratch-message nil)
