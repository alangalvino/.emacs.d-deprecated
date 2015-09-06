;; Code formatting config

;; Avoid emacs encoding magic comment for ruby
;; isn't necessary for ruby 2.*
(setq ruby-insert-encoding-magic-comment nil)

;; Tab width
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq ruby-indent-level 2)
(setq js-indent-level 2)
