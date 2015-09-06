(package-initialize)

;; Emacs custom config folder
(add-to-list 'load-path "~/.emacs.d/config")

;; Emacs custom config files
(load "init_emacs_gui")
(load "init_util_functions")
(load "init_formatting")

;; Plugins config
(load "init_el_get")
(load "init_ido")
(load "init_uniquify")
(load "init_ergoemacs")
(load "init_solarized")
(load "init_autopair")
(load "init_nav")

;; Other configs
(load "init_emacs")
(load "init_mac_os")
(load "init_key_bindings")
