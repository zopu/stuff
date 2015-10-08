;; A shared .emacs file to be used across environments.
;; Mostly Stuff I've cobbled together from other .emacs files.
;; Mike Perrow.

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(setq-default fill-column 80)

(setq-default tab-width 2)
(setq js-indent-level 2)
(setq-default indent-tabs-mode nil)

;; Tab stops for text mode
(setq-default tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80))
(add-hook 'text-mode-hook
  (function
   (lambda ()
     (setq tab-width 2)
     (define-key text-mode-map "\C-i" 'self-insert-command)
     )))

; Ugly tool bar for babies - give me back those pixels....
(customize-set-variable 'tool-bar-mode nil)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(require 'ido)
(ido-mode t)

;; where my custom scripts live
(add-to-list 'load-path "~/emacs/")

;; I use C-p as a prefix key for a bunch of commands below.
(define-prefix-command 'ctl-t-map)
(global-set-key "\C-t" 'ctl-t-map)

; A must have...
(global-set-key (kbd "C-t C-g") 'goto-line)

;; Home and end keys under screen
(global-set-key "\M-oh" 'beginning-of-line)
(global-set-key "\M-of" 'end-of-line)

; Some key bindings of my own...
(global-set-key "\M-k" 'backward-kill-word)
(global-set-key "\M-u" 'undo)
(global-set-key "\C-o" 'other-window)

(defun other-window-backwards ()
  "Switches buffer backwards."
  (interactive)
  (other-window -1))
(global-set-key "\C-to" 'other-window-backwards)

;; Hide the welcome screen
(setq inhibit-splash-screen t)

;; Highlights selections while selecting
(setq-default transient-mark-mode t)

;; always end a file with a newline
(setq require-final-newline t)

(defun rb ()
  "A fast wrapper around revert-buffer."
  (interactive)
  (revert-buffer))

(defun insert-todo ()
  "Shortcut for TODO(mikeperrow): "
  (interactive)
  (insert "TODO(mikeperrow): "))

(global-set-key "\C-t\C-d" 'insert-todo)

(defun current-buffer-in-other-window ()
  (interactive)
  (set-window-buffer (next-window) (get-buffer (buffer-name)))
  (other-window 1))

(global-set-key "\C-t\C-o" 'current-buffer-in-other-window)

;; Highlight matching parens
(show-paren-mode t)

;; I like column-number-mode
(setq-default column-number-mode t)

;; Let's try out line highlighting for a while...
(global-hl-line-mode 1)
(set-face-background 'hl-line "dim gray")

;; I don't like ~ files being dumped everywhere, and I'm a savaholic anyway...
(setq make-buckup-files nil)

;; I like side-by-side rather than top-bottom splits, so I need to configure ediff
(setq ediff-split-window-function 'split-window-horizontally)

; control-up and control-down scroll one line in either direction
(defun scroll-up-one-line ()
 (interactive) (scroll-up 1))
(defun scroll-down-one-line ()
 (interactive) (scroll-down 1))
(global-set-key [(control up)] 'scroll-down-one-line)
(global-set-key [(control down)] 'scroll-up-one-line)

;; git
(defun git-status ()
  "Shortcut for TODO(mikeperrow): "
  (interactive)
  (shell-command "git status &"))

(global-set-key "\C-t\C-s" 'git-status)

;; Put the backup turds in the backup toilet
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; git is awesome, but I don't want to be stating files on NFS just to open a file...
(defun vc-git-registered (file) nil)

;; trunc gdb windows to 80 chars
(add-hook 'gud-mode-hook
          '(lambda ()
             (make-local-variable 'truncate-partial-width-windows)
             (setq truncate-partial-width-windows nil))
)

; Get window splitting working sensibly
(setq split-height-threshold nil)
(setq split-width-threshold nil)

; TRAMP is awesome. Set it up so interactive login scripts don't kill it.
(setq tramp-default-method "scpx")

;; Rainbox delimiters. Should be in my load path (It's in dropbox).
(require 'rainbow-delimiters)

;; word count tools
(require 'wc)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(server-start)
