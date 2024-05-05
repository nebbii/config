;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Ben Wolthuis"
      user-mail-address "ben.wolthuis@jaamo.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;;(require 'haml-mode)
;;
(add-to-list 'auto-mode-alist '("\\.kt\\'" . kotlin-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.scss\\.erb\\'" . scss-mode))

(setq-default evil-shift-width 2)
(setq-default evil-shift-round nil)

(setq-default ruby-indent-level 2)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)   ;; change this to 2 if that is the width
(setq indent-line-function 'insert-tab)

(setq display-line-numbers-type 'relative)

(setq shell-command-switch "-ic")

;; sell soul to plover
(setq doom-leader-key "<f12>"
      doom-leader-alt-key "C-x")
(setq doom-localleader-key "<f12>"
      doom-localleader-alt-key "C-x")
;;(evil-set-leader nil (kbd "C-SPC"))  ;; sets the leader
;;(evil-set-leader nil (kbd "<leader> m") t) ;; sets localleader

;; Custom Editing Binds
(define-key evil-normal-state-map (kbd "C-p") 'consult-find)
(define-key evil-normal-state-map (kbd "C-n") 'projectile-find-file)
(define-key evil-normal-state-map (kbd "<tab>") 'next-buffer)
(define-key evil-normal-state-map (kbd "<backtab>") 'previous-buffer)

;; Robe
(define-key evil-normal-state-map (kbd "s-[") 'robe-jump)
(define-key evil-normal-state-map (kbd "M-[") 'robe-jump)

;;(define-key evil-normal-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "C-c") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'evil-normal-state)

(define-key evil-normal-state-map (kbd "s-c") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "s-c") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "s-c") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "s-c") 'evil-normal-state)

(define-key evil-normal-state-map (kbd "<f12> c a") 'async-shell-command)
(define-key evil-normal-state-map (kbd "<f12> e") 'treemacs-select-window)
(define-key evil-normal-state-map (kbd "<f12> r") 'consult-ripgrep)

(define-key evil-normal-state-map (kbd "<f12> v n") 'projectile-run-vterm)
(define-key evil-normal-state-map (kbd "<f12> v r") 'rename-buffer)

(setq projectile-switch-project-action 'projectile-find-file)

(setq shell-command-dont-erase-buffer 'end-last-out)

; vterm
(setq vterm-max-scrollback 4000)
(setq vterm-shell "/bin/zsh --login")
(require 'vterm)
(define-key vterm-mode-map (kbd "C-c C-c") 'vterm--self-insert)

; Code Review
; (setq code-review-fill-column 80)
; (setq code-review-new-buffer-window-strategy #'switch-to-buffer)
; (setq code-review-download-dir "/tmp/code-review/")
; (add-hook 'code-review-mode-hook
;           (lambda ()
;             ;; include *Code-Review* buffer into current workspace
;             (persp-add-buffer (current-buffer))))

(require 's3ed)
(s3ed-mode)


;;(setq doom-unreal-buffer-functions '(minibufferp))

;;(setq  x-meta-keysym 'super
;;       x-super-keysym 'meta)

(defun oppa-klonoa-style ()
  (let* ((banner '("                           `.-:////::::/-.                     "
                   "                        .::://::::---:::/++-                   "
                   "                      `-`:/+oo+:/``.-+:/.-/+o-                 "
                   "                     -.-++oo+oys/-`..-+////:os:                "
                   "                    +:/oo+/:::/ss:+//+o/::::oo/                "
                   "                    .yoo/:::+ooshsssssssssysyy+                "
                   "                    :oo:/oyysssssooooooooshddyyso+::-.         "
                   "                   `+ooyy.sosyssoooso/-..-shddyyysssss+        "
                   "                    .`-yy+osysoooo:`.-`  `oyhmdyysso+:`        "
                   "                     `.:+ss+`/oo:  `+y:  /osyhmo-`             "
                   "                    `-o/+so`        `/  :oysshhh`              "
                   "                     :y/ys/  -`     `  `  -osyhhy              "
                   "                     smhhs.-:-.` `.-.`....o+oshhho             "
                   "                    `ddsh+-oydoyydh:.---` soooyhdd.            "
                   "                   `smhsoo/+hooyhs++.     ooooshhd+            "
                   "                  `hmdy+/:/+:hoo/oss/:`   ooossyhhs            "
                   "       ...       :dmdyo:+::-`.+::+o++::.  oooooshdh-           "
                   "      ..` `.   `ss-yyy:+/:://-/::::///:/-`s+- +syddo           "
                   "      --.   `./s- .yy:s/:-:+::/::::oso/:/so/  .oyh+o           "
                   "      ---.`   `   `y/o/:/:://+/:::+-oso+:/o`   -o+`:     `     "
                   "      `----`      :os::://+:::::+o``:sooo/:-   `+` -`..`.--    "
                   "       `-..      -oo:::+++:::::+o/-/:::::::-       -.   `::    "
                   "   ``           .o+:::++/::::::/os::::::::/-           .---    "
                   "`.`           `-+/+:::+/::::-//.  `-:::::/s.          `.-.     "
                   "`--......`   :::/o:::++:::// -so/-` `-:::os`            `.`    "
                   "  ..---:..` ./```/:::/+:::oo-`/syhy/``-/os-               `.   "
                   "      `-...-yNmh/::::/+::/sss/.-sddmh---o.                  .. "
                   "      -...-oNNmd/:::://::+sssso:.+hds+y+`            --.......-"
                   "      :-.-+mmhsos-.-:/o/::oosssoo+++/ss+`             .------.`"
                   "      .:-:syysoos  ```.---:/+++++++/:-:-`              .       "))
         (longest-line (apply #'max (mapcar #'length banner))))
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)))

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-ts-mode-hook 'robe-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

;;(setq fancy-splash-image (concat doom-user-dir "cacochan.png"))

(setq +doom-dashboard-ascii-banner-fn #'oppa-klonoa-style)

;;(indent-guide-global-mode)
;;(set-face-foreground 'indent-guide-face "dimgray")
;;(setq indent-guide-char ".")

(pinentry-start)
