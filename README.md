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


## Dependencies

* [Mac OS][mac-os]
* [Emacs-mac-port][emacs-mac-port]
* [Zshell][zshell]
* [Inconsolata font][inconsolata]

## Additional tips

I use the icons from [emacs-sexy][emacs-sexy] on my emacs Mac OS app

[emacs-mac-port]: https://github.com/railwaycat/emacs-mac-port
[mac-os]: http://www.apple.com/osx/
[zshell]: http://www.zsh.org/
[inconsolata]: http://www.levien.com/type/myfonts/inconsolata.html
[emacs-sexy]: http://emacs.sexy/
[el-get]: https://github.com/dimitri/el-get
[ergoemacs]: https://github.com/ergoemacs/ergoemacs-mode
[nav]: https://github.com/ancane/emacs-nav
[solarized]: https://github.com/bbatsov/solarized-emacs
[autopair]: https://github.com/capitaomorte/autopair
