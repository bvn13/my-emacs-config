;; Auto-complete plugin <http://www.emacswiki.org/emacs/AutoComplete>
(defun ac-init()
    (require 'auto-complete-config)
    (ac-config-default)
    (if (system-is-windows)
        (add-to-list 'ac-dictionary-directories win-init-ac-dict-path)
        (add-to-list 'ac-dictionary-directories unix-init-ac-dict-path))
    (setq ac-auto-start        t)
    (setq ac-auto-show-menu    t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes   'lisp-mode)
    (add-to-list 'ac-sources 'ac-source-semantic) ;; искать автодополнения в CEDET
    (add-to-list 'ac-sources 'ac-source-variables) ;; среди переменных
    (add-to-list 'ac-sources 'ac-source-functions) ;; в названиях функций
    (add-to-list 'ac-sources 'ac-source-dictionary) ;; в той папке где редактируемый буфер
    (add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; по всему буферу
    (add-to-list 'ac-sources 'ac-source-files-in-current-dir))
(if (system-is-windows)
    (when (file-directory-p win-init-ac-path)
        (add-to-list 'load-path win-init-ac-path)
        (ac-init))
    (when (file-directory-p unix-init-ac-path)
        (add-to-list 'load-path unix-init-ac-path)
        (ac-init)))
