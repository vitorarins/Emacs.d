(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "b7553781f4a831d5af6545f7a5967eb002c8daeee688c5cbf33bf27936ec18b3" default)))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/"))))
 '(preview-auto-cache-preamble t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; set multi-term shell to zsh
(setq multi-term-program "/bin/zsh")

;; set default buffer size to 10000 in mult-term
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)
            (setq yas-dont-activate t)))


;; Adding go bin path to exec path
(setq exec-path (append exec-path '("/home/vitorarins/go/bin")))

;; Adding go workspace path
(setenv "GOPATH" "/home/vitorarins/go")
(load-file "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")
;; Adding godef jump to go to source code
(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -a -v && go test -v && go vet"))
  ; Godef jump key binding                                                      
  (local-set-key (kbd "<C-return>") 'godef-jump))
(add-hook 'go-mode-hook 'my-go-mode-hook)
;; Yasnippet bug
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))

(yas-global-mode 1)
