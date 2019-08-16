;;export to odt
(when (system-is-windows)
  (if (file-exists-p "\"C:\\Program Files\\LibreOffice\\program\\soffice.exe\"")
    (setq org-export-odt-convert-processes
        "\"C:\\Program Files\\LibreOffice\\program\\soffice.exe\" --headless --convert-to %f%x --outdir %d %i"
        org-export-odt-preferred-output-format "odt"
        org-export-odt-convert-process "\"C:\\Program Files\\LibreOffice\\program\\soffice.exe\"")
  (message "SOFFICE path not found")))
