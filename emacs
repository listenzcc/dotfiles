;; Home path
(setenv "HOME" "C:/Users/liste")
;; --------------------------------------------------------
;; Packages setting
;; Init packages
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives
	       (cons "melpa" (concat proto "://melpa.org/packages/")) t))
;; Initialize packages
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))
;; List packages
(defvar myPackages
  '(better-defaults
    elpy
    jedi
    py-autopep8
    git-commit
    magit
    highlight-symbol
    zenburn-theme
    company-tabnine))
;; (defvar myPackages
;;   '(ace-window
;;     auto-complete      
;;     better-defaults    
;;     company-jedi       
;;     ein                
;;     elpy               
;;     git-commit         
;;     highlight-symbol   
;;     imenu-list         
;;     imenus             
;;     jedi               
;;     magit              
;;     material-theme     
;;     py-autopep8))
;; Install packages
(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      myPackages)


;; --------------------------------------------------------
;; General setting
;; File coding
(setq default-buffer-file-coding-system 'utf-8)
;; Auto add blank line on bottom
(setq require-final-newline t)
;; Display time
(display-time-mode t)
;; Auto pair
(electric-pair-mode t)
;; Visible bell
(setq visible-bell t)
;; Display line numbers
(global-display-line-numbers-mode t)
;; Backup
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
;; Recursive minibuff
(setq enable-recursive-minibuffers t)
;; Stay on tail when up and down
(setq track-eol t)
;; When enter man page goto man buffer
(setq Man-notify-method 'pushy)
;; Show COMMAND when M-x COMMAND after 1 second
(setq suggest-key-bindings 1)


;; --------------------------------------------------------
;; Package settings
;; Load zenburn
(load-theme 'zenburn t)
;; Recent file
(recentf-mode 1)
;; Imenu
(semantic-mode 1)
(setq imenu-list-minor-mode t)
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "Imenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)

;; Elpy
(require 'elpy)
(elpy-enable)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq ac-max-width 0.4) ; This line solved the issue.
;; Set elpy RPC command
(setq elpy-rpc-python-command "C:\\Users\\liste\\AppData\\Local\\Programs\\Python\\Python36\\python.exe")
;; Let elpy use ipython
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; Use flycheck not flymake with elpy
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
;; Enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; Tabnine
(require 'company-tabnine)
(add-to-list 'company-backends 'company-tabnine)
;; Trigger completion immediately.
(setq company-idle-delay 0)
;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)


;; --------------------------------------------------------
;; Key board setting
;; <F7>, recentf-open-files
(global-set-key (kbd "<f7>") 'recentf-open-files)
;; C-k, on top kill whole line
(setq-default kill-whole-line t)
(global-set-key [C-tab] 'other-window)


;; --------------------------------------------------------
;; Coding setting
;; Python script indent guess
(setq python-indent-guess-indent-offset t)
;; Disable python-indent verbose
(setq python-indent-guess-indent-offset-verbose nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" default)))
 '(display-time-mode t)
 '(fci-rule-color "#eee8d5")
 '(global-display-line-numbers-mode t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-paren-colors (quote ("#2aa198" "#b58900" "#268bd2" "#6c71c4" "#859900")))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (zenburn-theme solarized-theme company-tabnine imenu-list imenus auto-complete ace-window ## window-numbering highlight-symbol term-run git-commit term+ term-cmd git-command git-commit-insert-issue magit powershell py-autopep8 material-theme jedi exec-path-from-shell elpygen elpy ein company-lean company-jedi better-defaults)))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c9485ddd1797")
     (60 . "#bf7e73b30bcb")
     (80 . "#b58900")
     (100 . "#a5a58ee30000")
     (120 . "#9d9d91910000")
     (140 . "#9595943e0000")
     (160 . "#8d8d96eb0000")
     (180 . "#859900")
     (200 . "#67119c4632dd")
     (220 . "#57d79d9d4c4c")
     (240 . "#489d9ef365ba")
     (260 . "#3963a04a7f29")
     (280 . "#2aa198")
     (300 . "#288e98cbafe2")
     (320 . "#27c19460bb87")
     (340 . "#26f38ff5c72c")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Microsoft YaHei Mono" :foundry "outline" :slant normal :weight normal :height 120 :width normal)))))
