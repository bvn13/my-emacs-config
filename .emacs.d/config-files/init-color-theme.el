;; Color-theme definition <http://www.emacswiki.org/emacs/ColorTheme>
(defun color-theme-init()
    (require 'color-theme)
    (color-theme-initialize)
    (setq color-theme-is-global t)
    (color-theme-charcoal-black))
(if (system-is-windows)
    (when (file-directory-p win-init-ct-path)
        (add-to-list 'load-path win-init-ct-path)
        (color-theme-init))
    (when (file-directory-p unix-init-ct-path)
        (add-to-list 'load-path unix-init-ct-path)
        (color-theme-init)))

;; set theme
;(load-theme 'tangotango t)
;(load-theme 'darktooth t)
(load-theme 'leuven t)


;; powerline
;(require 'powerline)
;(powerline-default-theme)

;; telephone-line
(require 'telephone-line)
(telephone-line-mode 1)
