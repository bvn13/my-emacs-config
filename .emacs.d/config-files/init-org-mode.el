
;; Org-mode settings
(require 'org) ;; Вызвать org-mode
(global-set-key "\C-ca" 'org-agenda) ;; поределение клавиатурных комбинаций для внутренних
(global-set-key "\C-cb" 'org-iswitchb) ;; подрежимов org-mode
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) ;; ассоциируем *.org файлы с org-mode
(setq org-log-done t) ;; ставить дату выполнения задач
(org-defkey org-mode-map (kbd "C-x <up>") 'org-move-subtree-up)
(org-defkey org-mode-map (kbd "C-x <down>") 'org-move-subtree-down)


;; enable line highlight in org-mode tables
;; from https://emacs.stackexchange.com/questions/29501/automatically-turn-on-hl-line-mode-inside-org-mode-tables
(defun highlight-current-table-line ()
  (interactive)
  (if (org-at-table-p)
      (hl-line-mode 1)
    (hl-line-mode -1)))
(defun setup-table-highlighting ()
  (add-hook 'post-command-hook #'highlight-current-table-line nil t))
(add-hook 'org-mode-hook #'setup-table-highlighting)
(add-hook 'orgtbl-mode-hook #'setup-table-highlighting)


;; changed emphasis - org-mode look
(setq org-emphasis-alist
  '(("*" (bold :foreground "Orange" ))
    ("/" italic)
    ("_" underline)
    ("=" (:background "maroon" :foreground "white"))
    ;;("~" (:background "deep sky blue" :foreground "MidnightBlue"))
    ("~" (bold :background "#F3D3B4" :foreground "#965F28"))
    ("+" (:strike-through t))))


;; hide special chars for text highlightening
(set 'org-hide-emphasis-markers t)
