(add-to-list 'load-path "~/.emacs.d/")

;; Autocomplete
(require 'auto-complete)
(global-auto-complete-mode t)

;; YASnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;; Python init
(load-library "init_python")

;; IPython
(require 'ipython)

;; Setup so that title of window has filename
(setq frame-title-format (list '(buffer-file-name "%f" "%b")))
(setq frame-icon-title-format frame-title-format)

;; Set tab-width to 8 for Cisco C code.
(custom-set-variables
 '(tab-width 8))

;; Support for GID
(load "~/.emacs.d/gid.elc")
;; Bind to F4
(global-set-key [f4] 'gid32)
;; Bind to shift F4
(global-set-key [S-f4] 'aid32)

;; Gives function/file browser
(load "~/.emacs.d/speedbar.elc")
;; Bound to F2
(global-set-key [f2] 'speedbar)
;; Toggle between main window and speedbar window
;; (global-set-key [f10] 'speedbar-get-focus) 

;; Assign a key to goto line
(global-set-key [f8] 'goto-line)

;; Assign a key for compile command
(global-set-key [f7]   'compile)
(global-set-key [f6]   'next-error)
(global-set-key [S-f6] 'previous-error)

;; Good for opening header file under cursor (not very useful)
(global-set-key [f3] 'open-file-under-cursor)
(fset 'open-file-under-cursor
   [?\C-\M-b ?\C-  ?\C-\M-f ?\C-\M-f ?\M-w ?\C-x ?\C-f ?\C-y return])

;; Miscellaneous keys that Emacs 21 doesn't define
(global-set-key [f5] 'ediff-buffers)
(global-set-key [end] 'end-of-buffer)
(global-set-key [home] 'beginning-of-buffer)

;; Remap keys...
(global-set-key [?\C-v] 'yank)
(global-set-key [?\C-z] 'undo)

;; For Mac, need overwrite mode defined
(global-set-key [?\C-+] 'overwrite-mode)

;; Display the column number in info line
(setq column-number-mode t)                                                    

;; Load paren mode, if not already
(require 'paren)
;; Turn on the paren / bracket matching mode
(setq show-paren-mode t)

;; Show/Hide feature
(load-library "hideshow")
(add-hook 'c-mode-hook
           '(lambda () (hs-minor-mode 1)))
(add-hook 'c++-mode-hook
           '(lambda () (hs-minor-mode 1)))
(add-hook 'java-mode-hook
           '(lambda () (hs-minor-mode 1)))

;; Tell search to be case sensitive
(setq-default case-fold-search nil)

;; Do some Ted Turner colorizing here
(cond ((fboundp 'global-font-lock-mode)
       (global-font-lock-mode t)
       (setq font-lock-maximum-decoration t)
;;       (setq font-lock-face-attributes
	     ;; These are the customizations I made
;;	     '((font-lock-comment-face       "DarkBrown")
;;	       (font-lock-string-face        "Green")
;;	       (font-lock-keyword-face       "Blue")
;;	       (font-lock-function-name-face "#4d0064008d00")
;;	       (font-lock-variable-name-face "Red")
;;	       (font-lock-type-face          "NavyBlue")
;;	       (region                       "White" "Black")
;;	       (font-lock-reference-face     "DarkGreen")
;;	      ))
       ;; Fontify no matter how large, but do so lazy, when big buffers
;;       (setq font-lock-maximum-size nil)
;;       (setq font-lock-support-mode 'lazy-lock-mode)
       ))
;;(custom-set-faces)


;; Trying Emacs in server mode. Client accesses with "emacsclient -n file".
;; Adding in a hook that will open a new frame, when server visits a file.
(server-start)
(defadvice server-start
  (around open-in-new-frame first () activate)
  (when window-system
    (add-hook 'server-visit-hook
              '(lambda () (setq server-window (new-frame))))
    ad-do-it))
;; Remove the new frame that is created, when client window is opened.
(defadvice server-edit
  (after delete-frame first () activate)
  (delete-frame))


;; Allow Postscript printing with "faces", but not colors
(custom-set-variables
 '(lpr-page-header-program "/usr/ucb/lpr"))

(setq ps-bold-faces
      '(font-lock-comment-face
        font-lock-keyword-face
        font-lock-builtin-face
        font-lock-function-name-face))
(setq ps-italic-faces
      '(font-lock-comment-face
        font-lock-variable-name-face
        font-lock-string-face))
(setq ps-underlined-faces
      '(font-lock-type-face
        font-lock-reference-face
        font-lock-builtin-face))
(setq ps-print-color-p nil)

(load "ps-print")

;; Printer setup...
(setq ps-lpr-command   "lpr"
      ps-lpr-switches  (list "-d" "-Sprint.esl.cisco.com")
      lpr-switches     (list "-d" "-Sprint.esl.cisco.com")
      ps-printer-name-option "-P"
      lpr-command      "lpr"
      ps-printer-name  "bxb01-01-q61-m")


;; Trial use of cscope 
(load "~/.emacs.d/xcscope.elc")
