;; Configuration options just for Mac OS

;; Command Key on Mac as Meta Key
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Just one frame
(setq ns-pop-up-frames nil)

;; Global set keys
(global-set-key (kbd "M-RET") 'toggle-fullscreen)

;; Add path of the pdflatex, for my Snow Leopard
(setenv "PATH" (concat "/usr/local/bin:/usr/texbin:" (getenv "PATH")))

;; Remove fringe
(fringe-mode 0)
