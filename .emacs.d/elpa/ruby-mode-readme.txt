Provides font-locking, indentation support, and navigation for Ruby code.

If you're installing manually, you should add this to your .emacs
file after putting it on your load path:

   (autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
   (add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
   (add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
