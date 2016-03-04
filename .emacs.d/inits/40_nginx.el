(require 'nginx-mode)
(add-hook 'conf-mode-hook
	  (lambda ()
	    (when (string-match "nginx" (buffer-file-name))
	                    (nginx-mode))))
