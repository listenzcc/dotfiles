
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    py-autopep8
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

;; back-up and version control
(setq ring-bell-function 'ignore)
(setq make-backup-files t)
(setq vc-make-backup-files t)
(setq backup-directory-alist
          `(("." . ,"~/.emacsFileBackup")))
(setq backup-by-copy t)
(setq backup-enable-predicate `ecm-backup-enable-predicate)
(defun ecm-backup-enable-predicate (filename)
  (and (not (string= "/tmp/" (substring filename 0 5)))
       (not (string-match "semanticdb" filename))
       ))
(setq version-control t)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq kept-new-versions 6)

;; custom keys
(setq-default kill-whole-line t)
(setq track-eol t)
(setq suggest-key-bindings 1)
(global-set-key (kbd "<C-tab>") 'other-window)
(require 'highlight-symbol)
(global-set-key (kbd "C-c h") 'highlight-symbol)
(global-set-key (kbd "M-n") 'highlight-symbol-next)
(global-set-key (kbd "M-p") 'highlight-symbol-prev)
(global-set-key (kbd "C-c r") 'highlight-symbol-remove-all)
(global-set-key (kbd "C-x g") 'magit-status)
; (setq inhibit-startup-message t) ;; hide the startup message
; python setting
(load-theme 'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(elpy-enable)
(setq elpy-rpc-python-command "python")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key (kbd "<f7>") 'recentf-open-files)

;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(exec-path
   (quote
    ("/home/zcc/.config/bin" "/usr/local/sbin" "/usr/local/bin" "/usr/sbin" "/usr/bin" "/sbin" "/bin" "/usr/games" "/usr/local/games" "/snap/bin" "/usr/lib/emacs/25.2/x86_64-linux-gnu")))
 '(package-selected-packages
   (quote
    (magit highlight-symbol highlight ## elpy material-theme better-defaults)))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 141 :width normal)))))
