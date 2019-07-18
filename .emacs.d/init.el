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
    (setq win-init-ac-dict-path "%HOME%/.emacs.d/plugins/auto-complete/dict")
    (set-default-font "Consolas"))

;; Unix path-variable
(when (system-is-linux)
    ;;(setq unix-sbcl-bin          "/usr/bin/sbcl")
    (setq unix-init-path         "~/.emacs.d/linux")
    (setq unix-init-ct-path      "~/.emacs.d/plugins/color-theme")
    (setq unix-init-ac-path      "~/.emacs.d/plugins/auto-complete")
    ;;(setq unix-init-slime-path   "/usr/share/common-lisp/source/slime/")
    (setq unix-init-ac-dict-path "~/.emacs.d/plugins/auto-complete/dict")
    ;;(set-default-font "Source Code Pro for Powerline")
    ;;(set-default-font "Meslo LG L DZ Regular for Powerline")
    ;;(set-default-font "DejaVu Sans Mono for Powerline")
    ;;(set-default-font "Go Mono for Powerline")
    (set-default-font "Iosevka Medium")
    (set-face-attribute 'default nil :height 100))


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
;(load-theme 'tangotango t)
(load-theme 'darktooth t)

;; powerline
;(require 'powerline)
;(powerline-default-theme)

;; telephone-line
(require 'telephone-line)
(telephone-line-mode 1)

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

;; hide special chars for text highlightening
(set 'org-hide-emphasis-markers t)

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


;; https://github.com/magnars/multiple-cursors.el
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;;export to odt
(when (system-is-windows)
  (if (file-exists-p "\"C:\\Program Files\\LibreOffice\\program\\soffice.exe\"")
    (setq org-export-odt-convert-processes
        "\"C:\\Program Files\\LibreOffice\\program\\soffice.exe\" --headless --convert-to %f%x --outdir %d %i"
        org-export-odt-preferred-output-format "odt"
        org-export-odt-convert-process "\"C:\\Program Files\\LibreOffice\\program\\soffice.exe\"")
  (message "SOFFICE path not found")))

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

;; changed emphasis - org-mode look
(setq org-emphasis-alist
  '(("*" (bold :foreground "Orange" ))
    ("/" italic)
    ("_" underline)
    ("=" (:background "maroon" :foreground "white"))
    ;;("~" (:background "deep sky blue" :foreground "MidnightBlue"))
    ("~" (bold :background "dark grey" :foreground "white"))
    ("+" (:strike-through t))))


;; Markdown mode
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#100e23" "#ff8080" "#95ffa4" "#ffe9aa" "#91ddff" "#c991e1" "#aaffe4" "#BAC9E4"])
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("85968e61ff2c490f687a8159295efb06dd05764ec37a5aef2c59abbd485f0ee4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "7356632cebc6a11a87bc5fcffaa49bae528026a78637acd03cae57c091afd9b9" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" "e800cc0b53464c7dc754c275ca4d0210696b822bcdac47bc4a09c69e321fe5be" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "ad7b5da3437a338bf6e3f41e0a0c20f397cfcf6798012363315b7b938ed88b51" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" "a622aaf6377fe1cd14e4298497b7b2cae2efc9e0ce362dade3a58c16c89e089c" "2a9039b093df61e4517302f40ebaf2d3e95215cb2f9684c8c1a446659ee226b9" "e2fd81495089dc09d14a88f29dfdff7645f213e2c03650ac2dd275de52a513de" "ab98c7f7a58add58293ac67bec05ae163b5d3f35cddf18753b2b073c3fcd8841" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" default)))
 '(diary-entry-marker (quote font-lock-variable-name-face))
 '(emms-mode-line-icon-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *note[] = {
/* width height num_colors chars_per_pixel */
\"    10   11        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"###...####\",
\"###.#...##\",
\"###.###...\",
\"###.#####.\",
\"###.#####.\",
\"#...#####.\",
\"....#####.\",
\"#..######.\",
\"#######...\",
\"######....\",
\"#######..#\" };")))
 '(fci-rule-color "#858FA5")
 '(gnus-logo-colors (quote ("#528d8d" "#c0c0c0")) t)
 '(gnus-mode-line-image-cache
   (quote
    (image :type xpm :ascent center :data "/* XPM */
static char *gnus-pointer[] = {
/* width height num_colors chars_per_pixel */
\"    18    13        2            1\",
/* colors */
\". c #1fb3b3\",
\"# c None s None\",
/* pixels */
\"##################\",
\"######..##..######\",
\"#####........#####\",
\"#.##.##..##...####\",
\"#...####.###...##.\",
\"#..###.######.....\",
\"#####.########...#\",
\"###########.######\",
\"####.###.#..######\",
\"######..###.######\",
\"###....####.######\",
\"###..######.######\",
\"###########.######\" };")) t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(jdee-db-active-breakpoint-face-colors (cons "#100e23" "#906cff"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#100e23" "#95ffa4"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#100e23" "#565575"))
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(package-selected-packages
   (quote
    (markdown-mode memoize markdown-mode+ markdown-preview-eww project-explorer neotree multiple-cursors telephone-line darktooth-theme spacemacs-theme sublime-themes doom-themes badger-theme nova-theme monokai-theme busybee-theme alect-themes gruvbox-theme which-key use-package tangotango-theme reverse-im powerline flatland-theme drag-stuff auto-complete anaconda-mode)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#1d2021")))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
