;; auto-revert-mode in dired-mode so - don't have to press 'g' all the time
(add-hook 'dired-mode-hook   (lambda nil (auto-revert-mode 1)))
(add-hook 'wdired-mode-hook (lambda nil (auto-revert-mode 1)))
