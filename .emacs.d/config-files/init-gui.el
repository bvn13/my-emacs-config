
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


;; Start window size
(when (window-system)
    (set-frame-size (selected-frame) 140 50))


;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")
