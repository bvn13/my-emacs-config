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
(setq imenu-auto-rescan      t) ;; ������������� ��������� ������ ������� � ������
(setq imenu-use-popup-menu nil) ;; ������� Imenu ������ � ����������
(global-set-key (kbd "<f6>") 'imenu) ;; ����� Imenu �� F6

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")


;; Load path for plugins
(if (system-is-windows)
    (add-to-list 'load-path win-init-path))
(if (system-is-linux)
    (add-to-list 'load-path unix-init-path))

;; Org-mode settings
(require 'org) ;; ������� org-mode
(global-set-key "\C-ca" 'org-agenda) ;; ����������� ������������ ���������� ��� ����������
(global-set-key "\C-cb" 'org-iswitchb) ;; ���������� org-mode
(global-set-key "\C-cl" 'org-store-link)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode)) ;; ����������� *.org ����� � org-mode
(setq org-log-done t) ;; ������� ���� ���������� �����
(org-defkey org-mode-map (kbd "C-x <up>") 'org-move-subtree-up)
(org-defkey org-mode-map (kbd "C-x <down>") 'org-move-subtree-down)

;; Inhibit startup/splash screen
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; ����� ����������� ����� ������� ����������� C-h C-a

;; Show-paren-mode settings
(show-paren-mode t) ;; �������� ��������� ��������� ����� {},[],()
(setq show-paren-style 'expression) ;; �������� ������ ��������� ����� {},[],()

;; Electric-modes settings
(electric-pair-mode    1) ;; ������������ {},[],() � ��������� ������� ������ ������
(electric-indent-mode -1) ;; ��������� ����������  electric-indent-mod'�� (default in Emacs-24.4)

;; Disable GUI components
(tooltip-mode      -1)
(menu-bar-mode      1) ;; ��������� ����������� ����
(tool-bar-mode     -1) ;; ��������� tool-bar
(if (system-is-windows)
  (scroll-bar-mode   -1) ;; ��������� ������ ���������
  )
(blink-cursor-mode -1) ;; ������ �� ������
(setq use-dialog-box     nil) ;; ������� ����������� �������� � ���� - ��� ����� ���������
(setq redisplay-dont-pause t)  ;; ������ ��������� ������
(setq ring-bell-function 'ignore) ;; ��������� �������� ������

;; Linum plugin
(require 'linum) ;; ������� Linum
(line-number-mode   t) ;; �������� ����� ������ � mode-line
(global-linum-mode  t) ;; ���������� ������ ����� �� ���� �������
(column-number-mode t) ;; �������� ����� ������� � mode-line
(setq linum-format " %d") ;; ������ ������ ��������� �����


;; Fringe settings
(when (system-is-windows)
  (fringe-mode '(8 . 0)) ;; ������������ ������ ������ �����
  (setq-default indicate-empty-lines t) ;; ���������� ������ �������� ������� ����� � ������� � ������� ������
  (setq-default indicate-buffer-boundaries 'left) ;; ��������� ������ �����
  )

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-������� ��������� ������ � mode-line
(display-time-mode             t) ;; ���������� ���� � mode-line
(size-indication-mode          t) ;; ������ ����� � %-��


;; Line wrapping
(setq word-wrap          t) ;; ���������� �� ������
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
(defalias 'list-buffers 'ibuffer) ;; ��������� ������ ������� ��� ������� C-x C-b
(global-set-key (kbd "<f2>") 'bs-show) ;; ������ buffer selection ������� F2

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
(global-font-lock-mode             t) ;; �������� � ������ Emacs-22. �� ������...
(setq font-lock-maximum-decoration t)

;; Indent settings
(setq-default indent-tabs-mode nil) ;; ��������� ����������� ������� ������� TAB'��
(setq-default tab-width          4) ;; ������ ��������� - 4 ���������� �������
(setq-default c-basic-offset     4)
(setq-default standart-indent    4) ;; ����������� ������ ������� - 4 ���������� �������
(setq-default lisp-body-indent   4) ;; �������� Lisp-��������� �� 4 ���������� �������
(global-set-key (kbd "RET") 'newline-and-indent) ;; ��� ������� Enter ��������� ������� � ������� ������
(setq lisp-indent-function  'common-lisp-indent-function)

;; Scrolling settings
(setq scroll-step               1) ;; �����-���� �� 1 ������
(setq scroll-margin            10) ;; �������� ����� ����/���� ����� ������ � 10 ����� �� �������/������ �������
(setq scroll-conservatively 10000)

;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

;; Clipboard settings
(setq x-select-enable-clipboard t)

;; End of file newlines
(setq require-final-newline    t) ;; �������� ����� ������ ������ � ����� ����� ��� ����������
(setq next-line-add-newlines nil) ;; �� ��������� ����� ������ � ����� ��� ��������
                                    ;; �������  ���������

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
;;(global-set-key (kbd "C-� �") (lambda () (interactive) (format-current-buffer))) ;; rus letter
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
    (add-to-list 'ac-sources 'ac-source-semantic) ;; ������ �������������� � CEDET
    (add-to-list 'ac-sources 'ac-source-variables) ;; ����� ����������
    (add-to-list 'ac-sources 'ac-source-functions) ;; � ��������� �������
    (add-to-list 'ac-sources 'ac-source-dictionary) ;; � ��� ����� ��� ������������� �����
    (add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; �� ����� ������
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
(setq bookmark-save-flag t) ;; ������������� ��������� �������� � ����
(when (file-exists-p (concat user-emacs-directory "bookmarks"))
    (bookmark-load bookmark-default-file t)) ;; ���������� ����� � ������� ���� � ����������
(global-set-key (kbd "<f3>") 'bookmark-set) ;; ������� �������� �� F3
(global-set-key (kbd "<f4>") 'bookmark-jump) ;; �������� �� �������� �� F4
(global-set-key (kbd "<f5>") 'bookmark-bmenu-list) ;; ������� ������ ��������
(setq bookmark-default-file (concat user-emacs-directory "bookmarks")) ;; ������� �������� � ���� bookmarks � .emacs.d


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
