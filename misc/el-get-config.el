(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

(setq el-get-sources
      '(
	(:name auto-complete
               :type git
	       :url "https://github.com/auto-complete/auto-complete.git"
	       :branch "1.3")
	(:name solarized-theme 
               :type elpa
	       :compile "solarized-theme")
	(:name expand-region
	       :type git
	       :url "https://github.com/magnars/expand-region.el/"
	       :compile "expand-region.el")
	)
      )

;; Packages to install
(setq my-packages 
      (append '(
		nav
                web-mode
		auto-complete
		solarized-theme
		autopair
		markdown-mode
		expand-region
		) 
	      (mapcar 'el-get-source-name el-get-sources))) 

(el-get 'sync my-packages)

;; Config and initialize packages

;; Auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; Autopair
(require 'autopair)
(autopair-global-mode)

;; Ido mode
(require 'ido)
(ido-mode t)

;; Load Solarized
(require 'solarized-theme)
(load-theme 'solarized-dark t)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
