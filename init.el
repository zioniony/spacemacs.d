;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(php
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     yaml
     helm
     (auto-completion :variables
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets/")
     better-defaults
     emacs-lisp
     imenu-list
     ansible
     react
     (git :variables
          git-magit-status-fullscreen t
          magit-push-always-verify nil
          magit-revision-show-gravatars nil)
     github
     chrome
     dash
     nginx
     html
     (javascript :variables
                 tern-command '("node" "~/.nvm/versions/node/v10.9.0/bin/tern")
                 )
     markdown
     shell-scripts
     (org :variables
          org-enable-github-support t
          org-enable-reveal-js-support t
          org-bullets-bullet-list '("■" "◆" "▲" "▶")
          org-agenda-dir "~/org/"
          org-projectile-file "~/org/todos.org"
          )
     sql
     (python :variables
             ;;python-backend 'lsp
             python-shell-completion-native nil
             python-test-runner 'pytest
             python-enable-yapf-format-on-save nil)
     ;; ipython-notebook
     ;; django
     restructuredtext
     (chinese :packages fcitx
              :variables chinese-enable-fcitx nil
              )
     ;; (shell :variables
     ;;        shell-default-term-shell "/bin/zsh"
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;;(c-c++ :variables c-c++-enable-clang-support t)
     (c-c++ :variables c-c++-backend 'lsp-ccls
			c-c++-lsp-sem-highlight-rainbow t)
	 dap
	 java
   zion
     ;; version-control
     ;;twocucao
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(xah-replace-pairs
									  ag
									  cal-china-x
									  electric-spacing
									  ess
									  highlight-thing
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                (todos . 5))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq configuration-layer--elpa-archives
        '(("melpa" . "elpa.emacs-china.org/melpa/")
          ("org"   . "elpa.emacs-china.org/org/")
          ("gnu"   . "elpa.emacs-china.org/gnu/"))
        )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."


  (setq create-lockfiles nil)
  (global-set-key (kbd "<backtab>") #'(lambda ()
                                        (interactive)
                                        (switch-to-buffer (other-buffer (current-buffer) 1))))
  (global-set-key (kbd "C-x x") 'call-last-kbd-macro)

  (defun markdown-count-article ()
    "1. 总字数,中字数,英字数,标点符号"
    (interactive)
    (message "Counting …")
    (save-excursion
      (let (wordCount charCount)
        (setq wordCount 0)
        (setq charCount (- (point-max) (point-min) ))
        (goto-char (point-min))
        (while (and (< (point) (point-max))
                    (re-search-forward "\\w+\\W*" (point-max) t))
          (setq wordCount (1+ wordCount)))

        (insert "Words: %d. Chars: %d." wordCount charCount)
        )))
  (defun single-lines-only ()
    "replace multiple blank lines with a single one"
    (interactive)
    (goto-char (point-min))
    (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
      (replace-match "\n")
      (forward-char 1)))
  (defun markdown-pangu-formated (begin end)
     "1.压缩空行
      2.去除尾部空格
      3.替换全角的字母和数字"
     (interactive "r")
     (single-lines-only)
     (delete-trailing-whitespace)
     )

  ;;解决org表格里面中英文对齐的问题
  (when (configuration-layer/layer-usedp 'chinese)
    (when (and (spacemacs/system-is-linux) window-system)
      (spacemacs//set-monospaced-font "DejaVu Sans Mono" "文泉驿等宽微米黑" 14 16)))

  ;; Setting Chinese Font
  (when (and (spacemacs/system-is-mswindows) window-system)
    (setq ispell-program-name "aspell")
    (setq w32-pass-alt-to-system nil)
    (setq w32-apps-modifier 'super)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family "DejaVu Sans Mono" :size 14))))
  ;; define the refile targets
  (setq org-agenda-file-time-log (expand-file-name "timelog.org" org-agenda-dir))
  (setq org-agenda-file-note (expand-file-name "notes.org" org-agenda-dir))
  (setq org-agenda-file-gtd (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-file-journal (expand-file-name "journal.org" org-agenda-dir))
  ;;(setq org-agenda-file-code-snippet (expand-file-name "snippet.org" org-agenda-dir))
  (setq org-agenda-file-someday (expand-file-name "someday.org" org-agenda-dir))
  (setq org-default-notes-file (expand-file-name "gtd.org" org-agenda-dir))
  (setq org-agenda-files (list org-agenda-dir))

  (setq org-todo-keywords
        (quote ((sequence "TODO(t!)"  "NEXT(n!)" "|" "DONE(d!)")
                (sequence "REPEAT(r)"  "WAIT(w!)"  "|"  "PAUSED(p@/!)" "CANCELLED(c@/!)" )
                (sequence "IDEA(i!)" "MAYBE(y!)" "STAGED(s!)" "WORKING(k!)" "|" "USED(u!/@)")
                )))
  (defun ly/set-python-path ()
    "Restart Python inferior processes."
    (interactive)
    (setenv "PYTHONPATH" (concat ":/home/ly/.pyenv/versions/3.6.6/lib/python3.6/site-packages:" (
getenv "PYTHONPATH"))))

  (defun open-time-log()
    (interactive)
    (find-file org-agenda-file-time-log)
    )
  (defun open-note ()
    (interactive)
    (find-file org-agenda-file-note)
    )
  (defun open-gtd ()
    (interactive)
    (find-file org-agenda-file-gtd)
  )
  (defun open-someday ()
    (interactive)
    (find-file org-agenda-file-someday)
    )
  (defun open-journal()
    (interactive)
    (find-file org-agenda-file-journal)
    )
  (defun show-wider-tab ()
	(setq tab-width 4))

  ;; set eclim for java
  (setq eclim-eclipse-dirs '("/usr/lib/eclipse")
        eclim-executable "/usr/lib/eclipse/eclim"
		eclimd-default-workspace "~/work/eclipse")
  ;; the %i would copy the selected text into the template
  ;;http://www.howardism.org/Technical/Emacs/journaling-org.html
  ;;add multi-file journal
  (setq org-capture-templates
        '(("t" "Tasks" entry (file+headline org-agenda-file-gtd "Tasks")
            "*** TODO [#B] %?\n  %i\n"
            :empty-lines 1)
          ("h" "Habits" item (file+headline org-agenda-file-gtd "Myself habits")
           "*** TODO [#A] %?\n  %i\n %U"
           :empty-lines 1)
          ("s" "Someday/Maybe" entry (file+headline org-agenda-file-gtd "Someday/Maybe")
           "*** TODO [#A] %? %i Added: %U"
           :empty-lines 1)
          ("f" "Files Tasks" entry (file+headline org-agenda-file-gtd "Files Tasks")
           "*** TODO [#A] %U [[file:%F][%F]]\t%?\t%^G %i\n\t "
           :empty-lines 1)
          ("c" "Calendar" entry (file+headline org-agenda-file-gtd "Calendar")
            "*** TODO [#A] %?\n  %i\n %U"
            :empty-lines 1)
          ("a" "Appointment" entry (file+headline org-agenda-file-gtd "Calendar")
           "* APPT %^{Description} %^g %? Added: %U"
           :empty-lines 1)
          ("l" "Log Time" entry (file+datetree org-agenda-file-time-log "Log Time")
           "** %U - %^{Activity}  :TIME:"
           )
          ("j" "Journal Entry" entry (file+datetree org-agenda-file-journal)
            "* %?"
            :empty-lines 1)))
  ;; (add-hook 'term-mode-hook 'toggle-truncate-lines)
  (global-highlight-thing-mode)
  ;;(desktop-save-mode)
  ;;(desktop-read)
  ;; https://github.com/emacs-helm/helm/wiki/FAQ#why-is-a-customizable-helm-source-nil
  (require 'helm)
  (require 'ag)
  ;(defmethod helm-setup-user-source ((source helm-source-ffiles))
  ;  (helm-source-add-action-to-source-if
  ;   "Byte compile file(s) async"
  ;   'async-byte-compile-file
  ;   source
  ;   'helm-ff-candidates-lisp-p))
  (setq helm-follow-mode-persistent t)

  (defun show-python-defun ()
     ""
     (interactive)
     (message (python-info-current-defun))
     )
  ;;(evil-set-initial-state 'inferior-python-mode 'emacs)
  (spacemacs/set-leader-keys "oy" 'sdcv-search-pointer+)
  (spacemacs/set-leader-keys "op" 'sdcv-search-pointer)
  (spacemacs/set-leader-keys "of" 'find-name-dired)
  (spacemacs/set-leader-keys "jQ" 'dumb-jump-go)
  (spacemacs/set-leader-keys-for-major-mode 'python-mode
      "fi" 'show-python-defun
      "fa" 'beginning-of-defun
      "fe" 'end-of-defun
      "fh" 'python-mark-defun
      "fr" 'load-full-python-layer
      "fd" 'sphinx-doc
      "fv" 'spacemacs//pyenv-mode-set-local-version
      "ft" 'buffer-init-python
      "ff" 'ag-python-files
  )

  
  ;; helm-find-files ignored pattern is on helm-boring-file-regexp-list.
  (setq helm-ff-skip-boring-files 't)
  (setq neo-show-hidden-files nil)
  ;;(setq debug-on-error t)
  (require 'cal-china-x)
  (setq mark-holidays-in-calendar t)
  (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
  (setq cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")))
  (setq calendar-holidays
      (append cal-china-x-important-holidays
              cal-china-x-general-holidays
              ))

  (setq simple-python-mode-hook (list 'electric-spacing-mode 'turn-on-evil-matchit-mode 'sphinx-doc-mode 'spacemacs//python-default 'spacemacs//init-jump-handlers-python-mode))
  (setq default-python-mode-hook (list 'electric-spacing-mode 'turn-on-evil-matchit-mode 'sphinx-doc-mode 'spacemacs//python-default 'spacemacs//init-jump-handlers-python-mode 'importmagic-mode 'spacemacs//python-setup-backend))

  (defun load-full-python-layer (&optional backend)
    "reload python file with all python-mode-hook and python-backend enabled"
    (interactive)
    (progn
      (setq my-python-backend python-backend)
      (setq python-mode-hook default-python-mode-hook)
      (and backend (setq python-backend backend))
      (find-alternate-file (buffer-file-name))
      (setq python-mode-hook simple-python-mode-hook)
      (setq python-backend my-python-backend)
      (message (format "reloaded: %s." (buffer-file-name)))
      )
    )
  (defun simplify-python-mode-hook ()
    "reset python-mode-hook"
    (interactive)
    (setq python-mode-hook simple-python-mode-hook)
    )
  (setq zion-previous-project-name "nil")

  (defun zion-project-change-pyenv-version ()
    "set pyenv version when change project"
    (interactive)
                                        ;"widget-button-press" "spacemacs/helm-find-buffers-windows" "spacemacs/helm-find-files-windows"
    (when (and (derived-mode-p 'python-mode)
               (not (string= (projectile-project-name) zion-previous-project-name))
               )
      (progn
        (setq zion-previous-project-name (or (projectile-project-name) "nil"))
        (if (fboundp 'pyenv-mode-versions) nil (pyenv-mode))
        (spacemacs//pyenv-mode-set-local-version)
        )
      )
    )

  (add-hook 'python-mode-hook 'electric-spacing-mode)
  (remove-hook 'python-mode-hook 'spacemacs//pyvenv-mode-set-local-virtualenv)
  (add-hook 'python-mode-hook 'simplify-python-mode-hook)
  (add-hook 'sh-mode-hook 'show-wider-tab)
  (add-hook 'projectile-after-switch-project-hook 'zion-project-change-pyenv-version)
  (add-hook 'post-command-hook 'zion-project-change-pyenv-version)

  (defun qiang-comment-dwim-line (&optional arg)
    "Replacement for the comment-dwim command. If no region is selected and current line is not blank and we are not at the end of the line, then comment current line. Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
    (interactive "*P")
    (comment-normalize-vars)
    (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
        (comment-or-uncomment-region (line-beginning-position) (line-end-position))
      (comment-dwim arg)))
  (global-set-key "\M-;" 'qiang-comment-dwim-line)

  ;;; bind key recentf-ido-find-file
  (defun recentf-ido-find-file ()
    "Find a recent file using ido."
    (interactive)
    (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
      (when file
        (find-file file))))

  (defun buffer-initlines (lines)
    "Add initial LINES to current buffer."
      (loop for line in lines
            do (progn
                 (insert line)
                 (newline))
            )
      )

  (defun code-initlines (lines mode)
    "Add initial LINES to specific MODE."
    (when (and (equal major-mode mode) (equal 0 (buffer-size)))
       (buffer-initlines lines)
      ))

  (defvar py-init-lines
    '(
      "#!/usr/bin/env python"
      "# -*- coding: utf-8 -*-"
      "from __future__ import division, absolute_import"
      "from __future__ import print_function, unicode_literals"
      )
    "Init lines to add to empty python files."
    )

  (defun buffer-init-python ()
    "Add initial python LINES to current buffer."
      (interactive)
	  (buffer-initlines py-init-lines)
      )

  (defun ag-python-files (string directory)
    "Search using ag in a given DIRECTORY for a given literal search STRING,
limited to python files. STRING defaults to the
symbol under point.

If called with a prefix, prompts for flags to pass to ag."
    (interactive (list (ag/read-from-minibuffer "Search string")
                       (read-directory-name "Directory: ")))
    (apply #'ag/search string directory '(:file-type "python")))

  (add-hook 'after-change-major-mode-hook
            '(lambda ()
               (code-initlines py-init-lines 'python-mode)
               )
            )

  ;; Bind clang-format-region to C-M-tab in all modes:
  ;; (global-set-key [C-M-tab] 'clang-format-region)
  ;;(spacemacs/set-leader-keys-for-major-mode 'c-or-c++-mode
  ;;  "fr" 'clang-format-region
  ;;  )
  ;; Bind clang-format-buffer to tab on the c++-mode only:
  ;(add-hook 'c-mode-common-hook 'clang-format-bindings)
  ;;(defun clang-format-bindings ()
  ;;  (define-key c-mode-base-map [tab] 'clang-format-buffer))
  (setq flycheck-checker-error-threshold 1000)


  ;; https://emacs.stackexchange.com/questions/12841/quickly-insert-source-blocks-in-org-mode/40914#40914
  (defvar org-sai-src-default "python"
   "This is the list used to store the default label for source code section.")

  (defun org-insert-src-block ()
    "Insert the source code section in `org-mode'."
    (interactive)
    (let* ((src-code-types
            '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
              "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
              "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
              "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
              "scheme" "sqlite"))
           (src-prompt-str
            (concat "Source code type (default "
                    org-sai-src-default
                    "): "))
           (temp-src-code-types
            (cons org-sai-src-default src-code-types))
           (src-type-str
            (completing-read src-prompt-str temp-src-code-types
                             nil nil nil nil org-sai-src-default)))
      (setq org-sai-src-default src-type-str))
      (insert (format "#+BEGIN_SRC %s\n" org-sai-src-default))
      (newline)
      (org-indent-line)
      (insert "#+END_SRC\n")
      (forward-line -2))

  ;; org babel
  (require 'ob)
  (require 'ob-shell)
  (require 'ob-python)
  (require 'ob-R)
  (setq org-src-fontify-natively t)
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (emacs-lisp . t)
     (shell . t)
     (R . t)
     (dot . t)
     ))
  (defun org-babel-execute:yaml (body params) body)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode
      "oe" 'org-edit-src-code
      "oi" 'org-insert-src-block
  )
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete-rst zeal-at-point winum unfill org-category-capture org-mime fuzzy flymd ghub request-deferred deferred company-ansible vue-mode flycheck-pos-tip flycheck xah-replace-pairs nginx-mode magit-gh-pulls gmail-message-mode ham-mode html-to-markdown github-search github-clone github-browse-file gist gh marshal logito pcache ht edit-server jinja2-mode ansible-doc ansible yaml-mode ox-reveal ox-gfm ein websocket pony-mode imenu-list dash-at-point counsel-dash helm-dash web-mode web-beautify tagedit sql-indent slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc insert-shebang helm-css-scss haml-mode fish-mode emmet-mode company-web web-completion-data company-tern dash-functional tern company-shell coffee-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic youdao-dictionary names chinese-word-at-point wgrep smex ivy-hydra counsel-projectile counsel swiper ivy pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict pos-tip ace-pinyin pinyinlib ace-jump-mode smeargle pbcopy orgit org-projectile org-present org org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-mode magit-gitflow launchctl htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md evil-magit magit magit-popup git-commit with-editor company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete volatile-highlights vi-tilde-fringe spaceline powerline rainbow-delimiters spinner org-bullets neotree lorem-ipsum ido-vertical-mode hydra parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make pkg-info epl helm-flx helm-descbinds helm-ag google-translate flx-ido flx fancy-battery eyebrowse evil-mc evil-lisp-state smartparens evil-indent-plus iedit evil-exchange evil-escape evil-ediff evil-args anzu evil goto-chg undo-tree highlight f s diminish define-word clean-aindent-mode bind-key packed dash ace-jump-helm-line helm avy helm-core popup package-build spacemacs-theme ws-butler window-numbering which-key uuidgen use-package toc-org restart-emacs request quelpa projectile popwin persp-mode pcre2el paradox org-plus-contrib open-junk-file move-text macrostep linum-relative link-hint info+ indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers hide-comnt help-fns+ golden-ratio fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-iedit-state evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump column-enforce-mode bind-map auto-highlight-symbol auto-compile async aggressive-indent adaptive-wrap ace-window ace-link)))
 '(safe-local-variable-values (quote ((encoding . UTF-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (python-docstring posframe fullframe org-re-reveal org-plus-contrib writeroom-mode visual-fill-column treemacs-projectile treemacs-evil pfuture closql emacsql-sqlite emacsql transient lv auto-complete-rst zeal-at-point unfill fuzzy flymd request-deferred deferred company-ansible vue-mode flycheck-pos-tip xah-replace-pairs nginx-mode magit-gh-pulls gmail-message-mode ham-mode html-to-markdown github-search github-clone github-browse-file gist gh marshal logito pcache jinja2-mode ansible-doc ansible yaml-mode ox-gfm ein websocket pony-mode dash-at-point counsel-dash helm-dash web-beautify tagedit sql-indent slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode less-css-mode json-snatcher json-reformat js2-refactor js-doc insert-shebang helm-css-scss fish-mode emmet-mode company-web web-completion-data company-tern dash-functional company-shell coffee-mode yapfify pyenv-mode py-isort hy-mode helm-pydoc anaconda-mode youdao-dictionary names chinese-word-at-point wgrep smex ivy-hydra pangu-spacing find-by-pinyin-dired chinese-pyim chinese-pyim-basedict pos-tip ace-pinyin pinyinlib ace-jump-mode smeargle pbcopy org org-pomodoro alert log4e gntp mmm-mode markdown-toc magit-gitflow launchctl helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-messenger gh-md company-statistics company auto-yasnippet ac-ispell auto-complete volatile-highlights vi-tilde-fringe rainbow-delimiters spinner org-bullets neotree lorem-ipsum ido-vertical-mode parent-mode helm-themes helm-swoop helm-projectile helm-mode-manager pkg-info epl helm-flx helm-descbinds helm-ag flx-ido flx fancy-battery evil-mc evil-lisp-state evil-indent-plus evil-exchange evil-escape evil-ediff evil-args anzu undo-tree highlight s diminish clean-aindent-mode bind-key packed ace-jump-helm-line avy popup package-build spacemacs-theme ws-butler window-numbering uuidgen restart-emacs quelpa popwin pcre2el open-junk-file move-text macrostep linum-relative link-hint info+ indent-guide hungry-delete highlight-parentheses hide-comnt help-fns+ golden-ratio fill-column-indicator expand-region exec-path-from-shell evil-visualstar evil-unimpaired evil-tutor evil-search-highlight-persist evil-numbers evil-iedit-state evil-anzu elisp-slime-nav column-enforce-mode bind-map auto-highlight-symbol auto-compile async aggressive-indent adaptive-wrap ace-window ace-link)))
 '(safe-local-variable-values (quote ((encoding . UTF-8))))
 '(sdcv-tooltip-timeout 60))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
