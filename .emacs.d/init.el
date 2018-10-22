(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))




;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
    (string-equal system-type "windows-nt"))


;; MS Windows path-variable
(when (system-is-windows)
    ;;(setq win-sbcl-exe          "C:/sbcl/sbcl.exe")
    (setq win-init-path         "%HOME%/.emacs.d")
    (setq win-init-ct-path      "%HOME%/.emacs.d/plugins/color-theme")
    (setq win-init-ac-path      "%HOME%/.emacs.d/plugins/auto-complete")
    ;;(setq win-init-slime-path   "C:/slime")
    (setq win-init-ac-dict-path "%HOME%/.emacs.d/plugins/auto-complete/dict"))
    (set-default-font "Consolas")

;; Unix path-variable
(when (system-is-linux)
    ;;(setq unix-sbcl-bin          "/usr/bin/sbcl")
    (setq unix-init-path         "~/.emacs.d/linux")
    (setq unix-init-ct-path      "~/.emacs.d/plugins/color-theme")
    (setq unix-init-ac-path      "~/.emacs.d/plugins/auto-complete")
    ;;(setq unix-init-slime-path   "/usr/share/common-lisp/source/slime/")
    (setq unix-init-ac-dict-path "~/.emacs.d/plugins/auto-complete/dict"))


;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      t) ;; автоматически обновлять список функций в буфере
(setq imenu-use-popup-menu nil) ;; диалоги Imenu только в минибуфере
(global-set-key (kbd "<f6>") 'imenu) ;; вызов Imenu на F6

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")


;; Load path for plugins
(if (system-is-windows)
    (add-to-list 'load-path win-init-path))
(if (system-is-linux)
    (add-to-list 'load-path unix-init-path))

;; Org-mode settings
(require 'org) ;; Вызвать org-mode
(global-set-key "\C-ca" 'org-agenda) ;; поределение клавиатурных комбинаций для внутренних
(global-set-key "\C-cb" 'org-iswitchb) ;; подрежимов org-mode
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) ;; ассоциируем *.org файлы с org-mode
(setq org-log-done t) ;; ставить дату выполнения задач
(org-defkey org-mode-map (kbd "C-x <up>") 'org-move-subtree-up)
(org-defkey org-mode-map (kbd "C-x <down>") 'org-move-subtree-down)

;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; включить выделение выражений между {},[],()
(setq show-paren-style 'expression) ;; выделить цветом выражения между {},[],()

;; Electric-modes settings
(electric-pair-mode    1) ;; автозакрытие {},[],() с переводом курсора внутрь скобок
(electric-indent-mode -1) ;; отключить индентацию  electric-indent-mod'ом (default in Emacs-24.4)

;; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode      1) ;; отключаем графическое меню
(tool-bar-mode     -1) ;; отключаем tool-bar
(if (system-is-windows)
  (scroll-bar-mode   -1) ;; отключаем полосу прокрутки
  )
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал

;; Linum plugin
(require 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк


;; Fringe settings
(when (system-is-windows)
  (fringe-mode '(8 . 0)) ;; органичиталь текста только слева
  (setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
  (setq-default indicate-buffer-boundaries 'left) ;; индикация только слева
  )

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах


;; Line wrapping
(setq word-wrap          t) ;; переносить по словам
(global-visual-line-mode t)

;; Start window size
(when (window-system)
    (set-frame-size (selected-frame) 140 50))

;; IDO plugin
(require 'ido)
(ido-mode                      t)
(icomplete-mode                t)
(ido-everywhere                t)
(setq ido-vitrual-buffers      t)
(setq ido-enable-flex-matching t)

;; Buffer Selection and ibuffer settings
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer) ;; отдельный список буферов при нажатии C-x C-b
(global-set-key (kbd "<f2>") 'bs-show) ;; запуск buffer selection кнопкой F2

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

;; Syntax highlighting
(require 'font-lock)
(global-font-lock-mode             t) ;; включено с версии Emacs-22. На всякий...
(setq font-lock-maximum-decoration t)

;; Indent settings
(setq-default indent-tabs-mode nil) ;; отключить возможность ставить отступы TAB'ом
(setq-default tab-width          4) ;; ширина табуляции - 4 пробельных символа
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; стандартная ширина отступа - 4 пробельных символа
(setq-default lisp-body-indent   4) ;; сдвигать Lisp-выражения на 4 пробельных символа
(global-set-key (kbd "RET") 'newline-and-indent) ;; при нажатии Enter перевести каретку и сделать отступ
(setq lisp-indent-function  'common-lisp-indent-function)

;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; Clipboard settings
(setq x-select-enable-clipboard t)

;; End of file newlines
(setq require-final-newline    t) ;; добавить новую пустую строку в конец файла при сохранении
(setq next-line-add-newlines nil) ;; не добавлять новую строку в конец при смещении
                                    ;; курсора  стрелками

;; Highlight search resaults
(setq search-highlight        t)
(setq query-replace-highlight t)

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

;; Bookmark settings
(require 'bookmark)
(setq bookmark-save-flag t) ;; автоматически сохранять закладки в файл
(when (file-exists-p (concat user-emacs-directory "bookmarks"))
    (bookmark-load bookmark-default-file t)) ;; попытаться найти и открыть файл с закладками
(global-set-key (kbd "<f3>") 'bookmark-set) ;; создать закладку по F3
(global-set-key (kbd "<f4>") 'bookmark-jump) ;; прыгнуть на закладку по F4
(global-set-key (kbd "<f5>") 'bookmark-bmenu-list) ;; открыть список закладок
(setq bookmark-default-file (concat user-emacs-directory "bookmarks")) ;; хранить закладки в файл bookmarks в .emacs.d


;; set theme
(load-theme 'tangotango t)

;; powerline
(require 'powerline)
(powerline-default-theme)


;; anaconda-mode for python buffer
;; https://github.com/proofit404/anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)
;; and add eldoc
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)


;; enable which-key mode
;;https://github.com/justbur/emacs-which-key
(require 'which-key)
(which-key-mode)

;; enable drug-stuff
;; https://github.com/rejeep/drag-stuff.el
;;(require 'drag-stuff)
;;(drag-stuff-mode t)

;; enable reverese-im
;; https://github.com/a13/reverse-im.el
(require 'use-package)
(use-package reverse-im
  :config
  (reverse-im-activate "russian-computer"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (reverse-im which-key tangotango-theme powerline flatland-theme drag-stuff auto-complete anaconda-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
