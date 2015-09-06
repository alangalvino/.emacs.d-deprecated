;; Ergonomic keyboard layout for emacs
(require 'ergoemacs-mode)
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "dv")
(ergoemacs-mode 1)

;; Forcing stractch message to nil
;; because ergoemacs automatically set this variable
(setq initial-scratch-message nil)
