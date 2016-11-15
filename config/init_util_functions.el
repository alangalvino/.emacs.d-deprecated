;; Comment line or region
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

;; Verify if font exists
(defun font-exists-p (font) "check if font exists" (if (null (x-list-fonts font)) nil t))

;; Remove linum mode of the nav buffer
(defun remove-linum-mode-of-nav-buffer ()
  (unless (equal nil (string-match "*nav*" (buffer-name))) (linum-mode 0) nil))
