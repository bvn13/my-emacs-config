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

;; Load path for plugins
(if (system-is-windows)
    (add-to-list 'load-path win-init-path))
(if (system-is-linux)
    (add-to-list 'load-path unix-init-path))


;; recursive loading config-files
(defun recursive-subdirs (directory &optional withroot)
  "Return a unsorted list of names of directories in DIRECTORY recursively.
If WITHROOT is non-nil, also DIRECTORY will be include."
  (let (subdirs)
    (dolist (element (directory-files-and-attributes directory nil nil nil))
      (let* ((path (car element))
             (isdir (car (cdr element)))
             (ignore (or (string= path ".") (string= path ".."))))
        (if (and (eq isdir t) (not ignore))
            (let ((dir (concat directory "/" path)))
              (setq subdirs (append (cons dir subdirs)
                                    (recursive-subdirs dir)))))))
    (if (not (eq withroot nil))
        (add-to-list 'subdirs directory))
subdirs))

(dolist (dir (recursive-subdirs "~/.emacs.d/config-files" t))
  (dolist (file (directory-files dir t "\.el$" nil))
    (load (file-name-sans-extension file))))


;;(add-to-list 'load-path "~/.emacs.d/config-files/")
;;(require 'init-autocomplete.el)
;;(require 'init-bookmarks.el)
;;(require 'init-buffers.el)
;;(require 'init-clipboard.el)
;;(require 'init-color-theme.el)
;;(require 'init-editing.el)
;;(require 'init-electric-mode.el)
;;(require 'init-export.el)
;;(require 'init-fringe.el)
;;(require 'init-gui.el)
;;(require 'init-ido-plugin.el)
;;(require 'init-imenu.el)
;;(require 'init-indent.el)
;;(require 'init-linum-plugin.el)
;;(require 'init-markdown.el)
;;(require 'init-mode-line.el)
;;(require 'init-neotree.el)
;;(require 'init-org-mode.el)
;;(require 'init-parent-mode.el)
;;(require 'init-python-mode.el)
;;(require 'init-scrolling.el)
;;(require 'init-search.el)
;;(require 'init-splash-screen.el)
;;(require 'init-syntax-highlighting.el)


;; Short messages
(defalias 'yes-or-no-p 'y-or-n-p)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AUTOGENERATED BELOW
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
 '(send-mail-function (quote sendmail-send-it))
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-delimiter-face ((t (:inherit markdown-markup-face :height 1.0))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.3))))
 '(org-document-title ((t (:foreground "#3FD7E5" :weight bold :height 1.7))))
 '(org-level-1 ((t (:foreground "#FE8019" :height 1.8))))
 '(org-level-2 ((t (:foreground "OliveDrab4" :height 1.6))))
 '(org-level-3 ((t (:foreground "#83A598" :height 1.5))))
 '(org-level-4 ((t (:foreground "#FABD2F" :height 1.4))))
 '(org-level-5 ((t (:foreground "#427B58" :height 1.3))))
 '(org-level-6 ((t (:foreground "#B8BB26" :height 1.2))))
 '(org-level-7 ((t (:foreground "#FB4933" :height 1.2))))
 '(org-level-8 ((t (:foreground "#83A598" :height 1.1)))))
