
;; anaconda-mode for python buffer
;; https://github.com/proofit404/anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)
;; and add eldoc
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
