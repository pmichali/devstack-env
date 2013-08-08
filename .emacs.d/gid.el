;; gid.el
;;
;; This provides support for GID32

(require 'compile)
(defun gid32 (command)
  "Run gid32, with user-specified args, and collect output in a buffer.
While gid runs asynchronously, you can use the \\[next-error] command
to find the text that gid hits refer to.  Gid is Greg Mcgary's
pre-digested-grep program, like ctags, but for grep."
  (interactive (list (read-input "Run gid32 (with args): "
                                 (symbol-around-point))))
  (compile-internal (concat "gid32 " command)
      "No more gid32 hits" "gid32" nil grep-regexp-alist))
;;  (compile1 (concat "gid32 " command)
;;			"No more gid32 hits" "gid32"))

(defun aid32 (command)
  "Run aid32, with user-specified args, and collect output in a buffer.
While aid runs asynchronously, you can use the \\[next-error] command
to find the text that gid hits refer to.  Aid is Greg Mcgary's
pre-digested-grep program, like ctags, but for grep."
  (interactive (list (read-input "Run aid32 (with args): "
                                 (symbol-around-point))))
  (compile-internal (concat "aid32 " command)
      "No more aid32 hits" "aid32" nil grep-regexp-alist))

(defun symbol-around-point ()
  "Return the symbol around the point as a string."
  (save-excursion
    (if (not (looking-at "\\s_\\|\\sw")) ; if not in a symbol
        (re-search-backward "\\s_\\|\\sw" nil t)) ; go into prev. one
    (buffer-substring
      (progn (forward-sexp 1) (point))
      (progn (backward-sexp 1) (point)))))

