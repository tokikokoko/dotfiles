(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-check-vc-info t)
 '(auto-revert-interval 0.3)
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/backup/" t)))
 '(auto-save-interval 60)
 '(auto-save-list-file-prefix "~/.emacs.d/backup/.saves-")
 '(auto-save-timeout 15)
 '(backup-directory-alist '((".*" . "~/.emacs.d/backup") ("\\`/[^/:]+:[^/:]*:")))
 '(byte-compile-warnings '(cl-functions))
 '(company-idle-delay 0)
 '(company-minimum-prefix-length 1)
 '(company-transformers '(company-sort-by-occurrence))
 '(counsel-find-file-ignore-regexp "\\(?:\\.\\(?:\\.?/\\)\\)")
 '(counsel-yank-pop-separator "
----------
")
 '(delete-old-versions t)
 '(doom-modeline-bar-width 4)
 '(doom-modeline-height 25)
 '(ivy-initial-inputs-alist nil)
 '(ivy-prescient-retain-classic-highlighting t)
 '(ivy-re-builders-alist
   '((t . ivy-prescient-re-builder)
     (swiper . ivy--regex-plus)) t)
 '(ivy-use-selectable-prompt t)
 '(modus-themes-bold-constructs nil)
 '(modus-themes-italic-constructs t)
 '(modus-themes-region '(bg-only no-extend))
 '(modus-themes-syntax '(green-strings yellow-comments alt-syntax))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")
     ("org" . "https://orgmode.org/elpa/")))
 '(package-selected-packages
   '(highlight-indent-guides modus-themes kaolin-themes restart-emacs org-bullets ac-slime lsp-ui lsp-mode doom-modeline company ivy-prescient prescient ivy-rich counsel swiper ivy blackout el-get hydra leaf-keywords))
 '(prescient-aggressive-file-save t)
 '(prescient-save-file "~/.emacs.d/prescient")
 '(show-paren-delay 0.2)
 '(version-control t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
