;; Emacs custom config folder
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/config")

;; Install Packages
(load "init_packages.el")

;; Emacs custom functions
(load "init_util_functions")

;; Style configs
(load "init_emacs_gui")
(load "init_solarized")
(load "init_formatting")

;; General configs
(load "init_emacs")
(load "init_mac_os")

;; Packages config
(load "init_ergoemacs")
(load "init_uniquify")
(load "init_autopair")
(load "init_eshell")
(load "init_helm")
(load "init_nav")

;; Other configs
(load "init_key_bindings")
(put 'erase-buffer 'disabled nil)
