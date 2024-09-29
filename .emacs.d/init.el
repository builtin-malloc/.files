(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(global-auto-revert-mode 1)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'electric)
(add-hook 'c-mode-hook   #'electric-pair-mode)
(add-hook 'c++-mode-hook #'electric-pair-mode)

(require 'paredit)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)

(require 'emmet-mode)
(add-hook 'sgml-mode-hook #'emmet-mode)
(add-hook 'css-mode-hook  #'emmet-mode)

(require 'text-mode)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . text-mode))

(require 'magit)
