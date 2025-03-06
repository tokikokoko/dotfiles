;;; Code:
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("org"   . "https://orgmode.org/elpa/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))

(leaf bytecomp
  :doc "compilation of Lisp code into byte code"
  :tag "builtin" "lisp"
  :custom (byte-compile-warnings . '(cl-functions)))
(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :custom ((auto-revert-interval . 0.3)
           (auto-revert-check-vc-info . t))
  :global-minor-mode global-auto-revert-mode)
(leaf paren
  :doc "highlight matching paren"
  :tag "builtin"
  :custom ((show-paren-delay . 0.2))
  :global-minor-mode show-paren-mode)
(leaf files
  :doc "file input and output commands for Emacs"
  :tag "builtin"
  :custom `((auto-save-timeout . 15)
	    (auto-save-interval . 60)
	    (auto-save-file-name-transforms . '((".*" ,(locate-user-emacs-file "backup/") t)))
	    (backup-directory-alist . '((".*" . ,(locate-user-emacs-file "backup"))
                                        (,tramp-file-name-regexp . nil)))
	    (version-control . t)
	    (delete-old-versions . t)))
(leaf startup
  :doc "process Emacs shell arguments"
  :tag "builtin" "internal"
  :custom `((auto-save-list-file-prefix . ,(locate-user-emacs-file "backup/.saves-"))))

;;; ivy-mode
(leaf ivy
  :doc "Incremental Vertical completYon"
  :req "emacs-24.5"
  :tag "matching" "emacs>=24.5"
  :url "https://github.com/abo-abo/swiper"
  :emacs>= 24.5
  :ensure t
  :blackout t
  :leaf-defer nil
  :custom ((ivy-initial-inputs-alist . nil)
           (ivy-re-builders-alist . '((t . ivy--regex-fuzzy)
				      (swiper . ivy--regex-plus)))
           (ivy-use-selectable-prompt . t))
  :global-minor-mode t
  :config
  (leaf swiper
    :doc "Isearch with an overview. Oh, man!"
    :req "emacs-24.5" "ivy-0.13.0"
    :tag "matching" "emacs>=24.5"
    :url "https://github.com/abo-abo/swiper"
    :emacs>= 24.5
    :ensure t
    :bind (("C-s" . swiper)))

  (leaf counsel
    :doc "Various completion functions using Ivy"
    :req "emacs-24.5" "swiper-0.13.0"
    :tag "tools" "matching" "convenience" "emacs>=24.5"
    :url "https://github.com/abo-abo/swiper"
    :emacs>= 24.5
    :ensure t

    :bind (("C-S-s" . counsel-imenu)
           ("C-x C-r" . counsel-recentf))
    :custom `((counsel-yank-pop-separator . "\n----------\n")
	      (counsel-find-file-ignore-regexp . ,(rx-to-string '(or "./" "../") 'no-group)))
    :global-minor-mode t))

(leaf ivy-rich
  :doc "More friendly display transformer for ivy."
  :req "emacs-24.5" "ivy-0.8.0"
  :tag "ivy" "emacs>=24.5"
  :emacs>= 24.5
  :ensure t
  :after ivy
  :global-minor-mode t)

(leaf prescient
  :doc "Better sorting and filtering"
  :req "emacs-25.1"
  :tag "extensions" "emacs>=25.1"
  :url "https://github.com/raxod502/prescient.el"
  :emacs>= 25.1
  :ensure t
  :commands (prescient-persist-mode)
  :custom `((prescient-aggressive-file-save . t)
	    (prescient-save-file . ,(locate-user-emacs-file "prescient")))
  :global-minor-mode prescient-persist-mode)

(leaf ivy-prescient
  :doc "prescient.el + Ivy"
  :req "emacs-25.1" "prescient-4.0" "ivy-0.11.0"
  :tag "extensions" "emacs>=25.1"
  :url "https://github.com/raxod502/prescient.el"
  :emacs>= 25.1
  :ensure t
  :after prescient ivy
  :custom ((ivy-prescient-retain-classic-highlighting . t))
  :global-minor-mode t)

;;; company
(leaf company
  :doc "Modular text completion framework"
  :req "emacs-24.3"
  :tag "matching" "convenience" "abbrev" "emacs>=24.3"
  :url "http://company-mode.github.io/"
  :emacs>= 24.3
  :ensure t
  :blackout t
  :leaf-defer nil
  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("<tab>" . company-complete-selection))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))
  :custom ((company-idle-delay . 0)
           (company-minimum-prefix-length . 1)
           (company-transformers . '(company-sort-by-occurrence)))
  :global-minor-mode global-company-mode)

;;; lsp
(leaf lsp-mode
  :doc "Language Server Protocol Support for Emacs"
  :ensure t
  :init
  (leaf lsp-ui
    :ensure t
    :hook (lsp-mode-hook . lsp-ui-mode))
  )

;;; slime
(leaf ac-slime
  :doc "Awesome lisp develop environment"
  :ensure t
  :init
  (load (expand-file-name "~/.roswell/helper.el"))
  )

;;; org-mode
(leaf org-bullets
  :doc "Beutify org bullets"
  :ensure t
  :hook (org-mode-hook . org-bullets-mode))

(use-package org-modern
  :custom
  (org-modern-progress '("○" "◔" "◑" "◕" "✅"))
  :hook
  ((org-mode . org-modern-mode)
   (org-agenda-finalize . org-modern-agenda)))

(setq org-agenda-file '("~/org/work/"))

;;; restart utility
(leaf restart-emacs
  :ensure t)

(provide 'init)

;;; export custom file
(setq custom-file (concat user-emacs-directory "/custom.el"))

;;; Edit
(electric-pair-mode 1)

;;; Appearance
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq default-directory (concat (getenv "HOME") "/" "Documents"))
(cd (concat (getenv "HOME") "/" "Documents"))

(setq default-frame-alist
      '(
	(font . "PlemolJP Console NF 17")
	))

(leaf solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

(leaf highlight-indent-guides
  :doc "Indent line"
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  )

