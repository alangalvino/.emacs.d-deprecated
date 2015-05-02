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
        (:name nav
               :type git
               :url "https://github.com/ancane/emacs-nav"
               :compile "nav.el")
        )
      )

;; Packages to install
(setq my-packages 
      (append '(
                ergoemacs-mode
                undo-tree
                dash
                nav
                web-mode
                auto-complete
                solarized-theme
                autopair
                markdown-mode
                ) 
              (mapcar 'el-get-source-name el-get-sources))) 

(el-get 'sync my-packages)

;; Autopair
(require 'autopair)
(autopair-global-mode)

;; Ido mode
(require 'ido)
(ido-mode t)

;; Load Solarized
(require 'dash)
(require 'solarized-theme)
(load-theme 'solarized-dark t)

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
(setq web-mode-code-indent-offset 2)

;; Ruby mode for rake and gem
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; Ruby folding
(add-hook 'ruby-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

(eval-after-load "hideshow"
'(add-to-list 'hs-special-modes-alist
              `(ruby-mode
                ,(rx (or "def" "{" "[")) ; Block start
                ,(rx (or "}" "]" "end"))                  ; Block end
                ,(rx (or "#" "=begin"))                   ; Comment start
                ruby-forward-sexp nil)))

;; Javascript folding
(add-hook 'js-mode-hook
          (lambda ()
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))

;; Folding key bidings
(global-set-key (kbd "C-c C-f") 'hs-show-block)
(global-set-key (kbd "C-c a C-f") 'hs-show-all)
(global-set-key (kbd "C-c C-h") 'hs-hide-block)
(global-set-key (kbd "C-c a C-h") 'hs-hide-all)

;; Uniquify buffers name
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward uniquify-separator ":")

;; Ergoemacs
(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "dv")
(require 'ergoemacs-mode)
(ergoemacs-mode 1)

;; Ergoemacs fixes
(global-set-key (kbd "C-SPC") 'set-mark-command)
(global-set-key (kbd "M-e") 'delete-backward-char)
(global-set-key (kbd "M-4") 'split-window-horizontally)
(global-set-key (kbd "C--") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C--") 'text-scale-decrease)
(global-set-key (kbd "C-x C-+") 'text-scale-increase)
(global-set-key (kbd "C-x C-0") 'ergoemacs-text-scale-normal-size)
