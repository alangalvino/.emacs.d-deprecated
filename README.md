# My minimalistic emacs.d

## Config folder

All my emacs configurations are in config folder separated in different files, ex.: 

"init_uniquify.el"

```
;; Uniquify buffers name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward uniquify-separator ":")
```

## Scripts folder

I wrote a script("scripts/emacs-terminal.sh") to open emacs Mac OS app from terminal. To install it, just run the command above after install [emacs-mac-port][emacs-mac-port]:

```
make config
```

## Installed plugins

* [El-get][el-get]
* [Ergoemacs][ergoemacs]
* [Nav][nav]
* [Solarized-theme][solarized]
* [Autopair][autopair]

[emacs-mac-port]: https://github.com/railwaycat/emacs-mac-port
[el-get]: https://github.com/dimitri/el-get
[ergoemacs]: https://github.com/ergoemacs/ergoemacs-mode
[nav]: https://github.com/ancane/emacs-nav
[solarized]: https://github.com/bbatsov/solarized-emacs
[autopair]: https://github.com/capitaomorte/autopair
