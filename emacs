;; custom hotkey
(global-set-key (kbd "C->") 'string-rectangle)
(global-set-key (kbd "C-`") 'set-mark-command)
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-c h") 'highlight-symbol)
(global-set-key (kbd "C-c n") 'highlight-symbol-next)
(global-set-key (kbd "C-c r") 'highlight-symbol-remove-all)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "<C-tab>") 'other-window)
(global-set-key (kbd "<f5>") 'revert-buffer)

(global-set-key (kbd "C-}") #'other-window)
(global-set-key (kbd "C-{") #'prev-window)
(defun prev-window ()
  (interactive)
  (other-window -1))

(global-set-key (kbd "<f7>") 'recentf-open-files)

;; custom coding
(setq default-buffer-file-coding-system 'utf-8) 
(setq python-indent-guess-indent-offset t)  
(setq python-indent-guess-indent-offset-verbose nil)
(add-hook 'after-init-hook 'global-company-mode)
(defun config/enable-jedi ()
  (add-to-list 'company-backends 'company-jedi))
(setq jedi:use-shortcuts t)

;; set home path
(setenv "HOME" "C:/Users/liste")

;; display time
(display-time-mode t)
;; auto pair
(electric-pair-mode t)
;; visible bell
(setq visible-bell t)

;; recent file
(recentf-mode 1)

;; display line numbers
(global-display-line-numbers-mode t)

;; backup
(setq make-backup-files t)
(setq vc-make-backup-files t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 6)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/emacsFileBackup")))
(setq backup-by-copying t)
(setq backup-enable-predicate 'ecm-backup-enable-predicate)
(defun ecm-backup-enable-predicate (filename)
  (and (not (string= "/tmp/" (substring filename 0 5)))
       (not (string-match "semanticdb" filename))
       ))

;; recursive minibuff
(setq enable-recursive-minibuffers t)

;; C-k on top kill whole line
(setq-default kill-whole-line t)

;; auto add blank line on bottom
(setq require-final-newline t)

;; stay on tail when up and down
(setq track-eol t)

;; when enter man page goto man buffer
(setq Man-notify-method 'pushy)

;; show COMMAND when M-x COMMAND after 1 second
(setq suggest-key-bindings 1)

;; imenu
(semantic-mode 1)
(setq imenu-list-minor-mode t)
(defun try-to-add-imenu ()
	(condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

;; packages: ein, elpy, flycheck, material-theme, py-autopep8
(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))
;;	     '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(ace-window         
    auto-complete      
    better-defaults    
    company-jedi       
    ein                
    elpy               
    git-commit         
    highlight-symbol   
    imenu-list         
    imenus             
    jedi               
    magit              
    material-theme     
    py-autopep8))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

(load-theme 'material t) ;; load material theme
(elpy-enable) ;; enable elpy
(setq elpy-rpc-python-command "C:\\Users\\liste\\AppData\\Local\\Programs\\Python\\Python36\\python.exe") ;; set elpy RPC command
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt") ;; let elpy use ipython

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (imenu-list imenus auto-complete ace-window ## window-numbering highlight-symbol term-run git-commit term+ term-cmd git-command git-commit-insert-issue magit powershell py-autopep8 material-theme jedi exec-path-from-shell elpygen elpy ein company-lean company-jedi better-defaults)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Microsoft YaHei Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
