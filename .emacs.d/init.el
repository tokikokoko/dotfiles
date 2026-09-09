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

;;; org-mode
(use-package org-modern
  :custom (
	   (org-modern-fold-stars '(("i>>" . "i>") ("ii>>" . "ii>") ("iii>>" . "iii>") ("iv>>" . "iv>") ("v>>" . "v>")))
	   (org-modern-todo-faces '(
	     ("WAIT"  . (:background "Orange"      :weight bold))
	     ("TODO"  . (:background "Yellow" :weight bold))
	     ("REMD"  . (:background "PaleGreen3"      :weight bold))
	     ("TRET"  . (:background "dark gray"       :weight bold))
	     ))
	   )
  :hook
  ((org-mode . org-modern-mode)
   (org-agenda-finalize . org-modern-agenda)))

(setq org-directory "~/Documents/org/")
(setq org-agenda-files (list org-directory))
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

; C-c a で org-agenda メニューを起動
(define-key global-map "\C-ca" 'org-agenda)

; 同じウィンドウ上にアジェンダ表示
(setq org-agenda-window-setup 'current-window)
; アジェンダ表示で下線を用いる
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1)))
(setq hl-line-face 'underline)
; 標準の祝日を利用しない
(setq calendar-holidays nil)

;; org-journal
(leaf org-journal
  :emacs>= 25.1
  :ensure t
  :custom `(
	    (org-journal-dir . "~/Documents/org")
	    (org-journal-file-format . "%Y-%m-%d.org")
	    (org-journal-date-format . "%Y-%m-%d")
	    (org-journal-time-format . "%R\n\n")
	    )
  :bind (("\C-cjn" . org-journal-new-entry))
  )

; TODOキーワード設定
(setq org-todo-keywords
  '((sequence "TODO(t)" "DOIN(n)" "WAIT(w)" "TRET(e)" "REMD(r)"
       "|" "DONE(d)" "SKIP(x)")))
(setq org-todo-keyword-faces
  '(
    ("WAIT"  . (:foreground "CadetBlue3"      :weight bold))
    ("TODO"  . (:foreground "LightGoldenrod3" :weight bold))
    ("REMD"  . (:foreground "PaleGreen3"      :weight bold))
    ("TRET"  . (:foreground "dark gray"       :weight bold))
    ))

; DONEとなった時間を記録しない
(setq org-log-done nil)

; DONEステータス時の見出しの色を変えない
(setq org-fontify-done-headline nil)

;; org-capture
;; C-c c で org-capture メニューを起動
(global-set-key "\C-cc" 'org-capture)
;; C-c c t で 9_REMIND.org にリマインドタスクを登録
(setq org-capture-templates
      '(
	("t" "Todo" entry (file+headline "~/Documents/org/9_REMIND.org" "[#C] TODO")
         "* TODO [#C] %? (wrote on %U)")
	))

;; org-mermaid
(leaf ob-mermaid
  :ensure t
  :init
  (org-babel-do-load-languages
    'org-babel-load-languages
    '((mermaid . t))
    )
  )

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

;;;; Font
;(setq default-frame-alist
;      '(
;	(font . "HackGen Console NF 16")
;	))
(set-face-attribute 'default nil :family "HackGen Console NF" :height 140)

(leaf solarized-theme
  :ensure t
  :config
  (load-theme 'solarized-light t))

