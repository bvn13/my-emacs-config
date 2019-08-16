
;; Markdown mode
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))



(custom-set-faces

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-delimiter-face ((t (:inherit markdown-markup-face :height 3.0))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.7))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.4))))
 '(org-document-title ((t (:foreground "#3FD7E5" :weight bold :height 1.7))))
 '(org-level-1 ((t (:foreground "#FE8019" :height 1.8))))
 '(org-level-2 ((t (:foreground "OliveDrab4" :height 1.6))))
 '(org-level-3 ((t (:foreground "#83A598" :height 1.5))))
 '(org-level-4 ((t (:foreground "#FABD2F" :height 1.4))))
 '(org-level-5 ((t (:foreground "#427B58" :height 1.3))))
 '(org-level-6 ((t (:foreground "#B8BB26" :height 1.2))))
 '(org-level-7 ((t (:foreground "#FB4933" :height 1.2))))
 '(org-level-8 ((t (:foreground "#83A598" :height 1.1)))))
