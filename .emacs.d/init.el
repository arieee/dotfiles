;enable font-lock
;(when(fboundp 'global-font-lock-mode)(global-font-lock-mode t))
;(setq font-lock-maximum-decoration t)

;use UTF-8
(coding-system-put 'utf-8 'category 'utf-8)
(set-language-info "Japanese" 'coding-priority(cons 'utf-8(get-language-info "Japanese" 'coding-priority)))
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)

; not make backup files
(setq make-backup-files nil)
(setq auto-save-default nil)


; highlight selected region
;(transient-mark-mode t)

;use bash
;(setq explicit-shell-file-name "/bin/bash") 
;(setq shell-file-name "/bin/bash")
;(setq shell-command-switch "-c")

;hide inputting password
;(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;handle escape sequences
;(autoload 'ansi-color-for-comint-mode-on "ansi-color"
;          "Set `ansi-color-for-comint-mode' to t." t)
;(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;use UTF-8
(add-hook 'shell-mode-hook(lambda()(set-buffer-process-coding-system 'utf-8 'utf-8)))

;adjust window size
;(setq default-frame-alist (append (list
;				   '(width . 40)
;				   '(height . 36))
;				  default-frame-alist))

;; 2014/06/08 追加 開発ツール徹底攻略emacs記事より
;; load-path を追加する関数を定義
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;elispとconfディレクトリをサブディレクトリごとload-pathに追加
(add-to-load-path "elisp" "conf")

;; auto-install
;;(install-elisp "http://www.emacswiki.org/emacs/download/auto-install.el")
(when (require 'auto-install nil t)
  ;; install directoryを設定する 初期値は ~/.emacs.d/auto-install/
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWikiに登録されているelispの名前を取得する
  (auto-install-update-emacswiki-package-name t)
  ;; install-elispの関数を利用可能にする
  (auto-install-compatibility-setup))

;; ELPA,MELPA,MARMALADEの設定
(require 'package)
;; Add package-archives
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; Initialize
(package-initialize)

;; paren-mode 対応する括弧を強調して表示する
(setq show-paren-delay 0) ;表示までの秒数.初期値は0.125
(show-paren-mode t) ;有効化
;; parenのスタイル : mixedは画面内に対応する括弧がある場合は括弧だけを，ない場合は括弧で囲まれた部分をハイライト
(setq show-paren-style 'mixed)
;; faceを変更
;(set-face-background 'show-paren-match-face nil)
;(set-face-underline-p 'show-paren-match-face "yellow")
(set-face-background 'show-paren-match-face "color-219")

;; 現在行にunderlineを引いてくれる．
(setq hl-line-face 'underline)
(global-hl-line-mode)

;;C-hにbackspaceと同じ処理を割り当てる
(keyboard-translate ?\C-h ?\C-?)
;;helpは別のキーバインドに割り当て
(global-set-key (kbd "C-x ?") 'help-command)

;; 2014/06/08 追加 鈴木先輩などのadviceを元にwebで調べて追加
;; Auto-insert 拡張子に合わせて自動的にheaderを追加してくれる
(require 'autoinsert)
(auto-insert-mode 1)

;;insert時の問い合わせ無効化
(setq auto-insert-query nil)

;;template directory のsetting
(setq auto-insert-directory "~/.emacs.d/share/template/")

;;hookの追加
(add-hook 'find-file-hooks 'auto-insert)

;;pythonのtemplate
(setq auto-insert-alist
      (append '(
		(("\\.py$"."python template")
		 nil
		 "#!/usr/bin/env python\n"
		 "# -*- coding:utf-8 -*-"
		 "\n"
		 "import sys,os\n"
		 "#import math,re,datetime,time,random\n"
		 "\n"
		 _
		 "\n"
		 "if __name__ == \"__main__\":\n"
		 ))
	      auto-insert-alist))

;;auto-complete
(add-to-list 'load-path "~/.emacs.d/elisp/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)
;;少し長い単語の時だけ補完
;(setq ac-auto-start 4)
;;補完メニューを0.8秒後に自動で表示
;(setq ac-auto-show-menu 0.8)
;;補完メニュー表示時のみC-n/C-pで補完候補を選択
;(setq ac-use-menu-map t)
;;defaultで設定済み
;(define-key ac-menu-map "\C-n" 'ac-next)
;(define-key ac-menu-map "\C-p" 'ac-previous)


;;helm
(add-to-list 'load-path "~/.emacs.d/packages/helm")
(when (require 'helm-config nil t)
  (helm-mode 1)

  (define-key global-map (kbd "M-x")     'helm-M-x)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  (define-key global-map (kbd "C-c i")   'helm-imenu)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)

  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))
  
  ;; For find-file etc.
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
  ;; For helm-find-files etc.
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

  ;;advice for not new-make-files when find-buffering
  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it)))

;;js2-mode setting https://raw.github.com/mooz/js2-mode/master/js2-mode.el
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;esup Emacs Start Up Profiler https://github.com/jschaf/esup
;(autoload 'esup "esup" "Emacs Start Up Profiler." nil)
;(require 'esup)

;;Calcurate bootup time
(defun message-startup-time ()
  (message
   "Emacs loaded in %dms"
   (/ (- (+ (third after-init-time) (* 1000000 (second after-init-time)))
	 (+ (third before-init-time) (* 1000000 (second before-init-time))))
      1000)))
(add-hook 'after-init-hook 'message-startup-time)
