# My minimalistic emacs.d

## Config folder

All my emacs configurations are in config folder separated in different files, ex.: 

"init_uniquify.el"

```
;; Uniquify buffers name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward uniquify-separator ":")
```

## Installed plugins

* [El-get][el-get]
* [Ergoemacs][ergoemacs]
* [Nav][nav]
* [Solarized-theme][solarized]
* [Autopair][autopair]

[el-get]: https://github.com/dimitri/el-get
[ergoemacs]: https://github.com/ergoemacs/ergoemacs-mode
[nav]: https://github.com/ancane/emacs-nav
[solarized]: https://github.com/bbatsov/solarized-emacs
[autopair]: https://github.com/capitaomorte/autopair
