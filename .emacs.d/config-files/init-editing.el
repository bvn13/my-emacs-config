;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; Line wrapping
(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)


;; insert date
(global-set-key (kbd "C-c d") 'insert-standard-date)
(global-set-key (kbd "C-c C-c d") 'insert-date)
(defun insert-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "%d.%m.%Y")
                   ((equal prefix '(4)) "%Y-%m-%d")
                   ((equal prefix '(16)) "%A, %d. %B %Y")))
          (system-time-locale "de_DE"))
      (insert (format-time-string format))))
(defun insert-date (format)
    "Wrapper around format-time-string."
    (interactive "MFormat: ")
    (insert (format-time-string format)))
(defun insert-standard-date ()
    "Inserts standard date time string."
    (interactive)
    (insert (format-time-string "%F %T")))

;; End of file newlines
(setq require-final-newline    t) ;; добавить новую пустую строку в конец файла при сохранении
(setq next-line-add-newlines nil) ;; не добавлять новую строку в конец при смещении
                                    ;; курсора  стрелками

;; Easy transition between buffers: M-arrow-keys
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'meta))

;; Delete trailing whitespaces, format buffer and untabify when save buffer
(defun format-current-buffer()
    (indent-region (point-min) (point-max)))
(defun untabify-current-buffer()
    (if (not indent-tabs-mode)
        (untabify (point-min) (point-max)))
    nil)
;;(add-to-list 'write-file-functions 'format-current-buffer) ;; WARN: brokes saving file!!!
(global-set-key (kbd "C-c f") (lambda () (interactive) (format-current-buffer)))
;;(global-set-key (kbd "C-c C-f") (lambda () (interactive) (format-current-buffer)))
;;(global-set-key (kbd "C-с а") (lambda () (interactive) (format-current-buffer))) ;; rus letter
(add-to-list 'write-file-functions 'untabify-current-buffer)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)
