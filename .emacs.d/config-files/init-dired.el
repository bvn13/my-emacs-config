;; just comment:
;; C-x C-q - to make dired buffer editable
;; C-c C-c - to write changes to disk


;; auto-revert-mode in dired-mode so - don't have to press 'g' all the time
(add-hook 'dired-mode-hook   (lambda nil (auto-revert-mode 1)))
(add-hook 'wdired-mode-hook (lambda nil (auto-revert-mode 1)))
