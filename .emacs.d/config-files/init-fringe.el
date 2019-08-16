;; Fringe settings
(when (system-is-windows)
  (fringe-mode '(8 . 0)) ;; органичиталь текста только слева
  (setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
  (setq-default indicate-buffer-boundaries 'left) ;; индикация только слева
  )
