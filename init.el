;;
;; To show lines' number
;;
(global-linum-mode 1)
;;
;; To set system environments for HOME & PATH
;;
(setenv "HOME" "C:/EMACS")
(setenv "PATH" "C:/EMACS/bin")
(setq default-directory "~/")
(set-language-environment "UTF-8")
;;
;; To set load-path
(add-to-list 'load-path "C:/EMACS/.emacs.d/elpa")
;;
;; set theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)

;;===================================================

;; font
;;(auto-compression-mode t)
(add-hook 'shell-mode-hook (function
   (lambda () (set-buffer-process-coding-system 'euc-japan 'euc-japan))))
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(set-default-font "Microsoft YaHei-12")

;; japanese week
 (setq time-stamp-format
      '(time-stamp-yyyy/mm/dd time-stamp-hh:mm:ss
                              time-stamp-japanese-a))

(defun org-mode-time-locale ()
  (set (make-local-variable 'system-time-locale) "C"))
(add-hook 'org-mode-hook 'org-mode-time-locale)

(setq my-org-agenda-dir "~/org/")
(setq org-agenda-files (list my-org-agenda-dir))

;; TODO related
;;
(setq org-log-done 'time)
(setq org-todo-keywords
	'((type "todo(t!)" "work(w!)" "study(s!)" "leisure(l!)" "|")
	  (sequence "PENDING(p!)" "TODO(t!)" "NEXT(n)" "SOMEDAY(s)" "|" "DONE(d!)" "ABORT(a@/!)")))

(setq org-todo-keyword-faces
  
	'(("work" . (:background "red" :foreground "white" :weight bold))

	  ("study" . (:background "white" :foreground "red" :weight bold))
    
	  ("leisure" . (:foreground "MediumBlue" :weight bold)) 
    
	  ("PENDING" . (:background "LightGreen" :foreground "gray" :weight bold))
   
	  ("TODO" . (:background "DarkOrange" :foreground "black" :weight bold))
    
	  ("DONE" . (:background "azure" :foreground "green" :weight bold)) 
   
          ("ABORT" . (:background "gray" :foreground "black"))
))

;; 优先级范围和默认任务的优先级

(setq org-highest-priority ?A)

(setq org-lowest-priority  ?E)

(setq org-default-priority ?E)

;; 优先级醒目外观

(setq org-priority-faces
  
	'((?A . (:background "red" :foreground "white" :weight bold))
    
	  (?B . (:background "DarkOrange" :foreground "white" :weight bold))
  
	  (?C . (:background "yellow" :foreground "DarkGreen" :weight bold))
  
	  (?D . (:background "DodgerBlue" :foreground "black" :weight bold))
 
	  (?E . (:background "SkyBlue" :foreground "black" :weight bold))
))

;; tag
(setq org-enforce-todo-dependencies t)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () 
		(org-bullets-mode 1)))
;;=============================================================================
;; org-agenda
(define-key global-map "\C-ca" 'org-agenda)
;; org-remember
(define-key global-map [f12] 'remember)
;; tap C-c C-c to save remember file to ~/.note
(setq org-default-notes-file "~/note.org")
;;===========================================================================
;; (setq latex-run-command "pdflatex")
(font-lock-add-keywords 'lisp-mode '("[(]" "[)]"))
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;===========================================================================
;; grammer highlight
(global-font-lock-mode t)
;;
;;===========================================================================
;; support copy & paste from external program
(setq x-select-enable-clipboard t)

;;
;;===========================================================================
;; change line
(toggle-truncate-lines 1)

;; show time
(setq display-time-string-forms
      '((format "%s/%s/%s(%s) %s:%s" year month day dayname 24-hours minutes)
        load
        (if mail " Mail" "")))
(setq display-time-kawakami-form t)
(setq display-time-12hr-format t)
(display-time)

(setq load-path
      (cons
       (expand-file-name "~/.site-lisp/instamp") load-path))
(autoload 'instamp
  "instamp" "Insert TimeStamp on the point" t)
;;(define-key global-map "\C-cs" 'instamp)
(setq instamp-remove-preceding-zero nil)


;; LATEX

(setq org-src-fontify-natively t)