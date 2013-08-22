   This is a major mode for editing C# code. It performs automatic
   indentation of C# syntax; font locking; and integration with compile.el;
   flymake.el; yasnippet.el; and imenu.el.

   csharp-mode requires CC Mode 5.30 or later.  It works with
   cc-mode 5.31.3, which is current at this time.

Features:

  - font-lock and indent of C# syntax including:
      all c# keywords and major syntax
      attributes that decorate methods, classes, fields, properties
      enum types
      #if/#endif  #region/#endregion
      instance initializers
      anonymous functions and methods
      verbatim literal strings (those that begin with @)
      generics

  - automagic code-doc generation when you type three slashes.

  - intelligent insertion of matched pairs of curly braces.

  - compile tweaks. Infers the compile command from special comments
    in the file header.  Also, sets the regex for next-error, so that
    compile.el can handle csc.exe output.

  - flymake integration
      - select flymake command from code comments
      - infer flymake command otherwise (presence of makefile, etc)
      - Turn off query-on-exit-flag for the flymake process.
      - define advice to flymake-goto-line , to allow it to goto the
        appropriate column for the error on a given line. This works
        with `flymake-goto-next-error' etc.

  - yasnippet integration
      - preloaded snippets

  - imenu integration - generates an index of namespaces, classes,
    interfaces, methods, and properties for easy navigation within
    the buffer.



Installation instructions
--------------------------------

Put csharp-mode.el somewhere in your load path, optionally byte-compile
it, and add the following to your .emacs file:

  (autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
  (setq auto-mode-alist
     (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))


Optionally, define and register a mode-hook function. To do so, use
something like this in your .emacs file:

  (defun my-csharp-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (require 'flymake)
     (flymake-mode 1)
     (require 'yasnippet)
     (yas/minor-mode-on)
     (require 'rfringe)
     ...insert more code here...
     ...including any custom key bindings you might want ...
  )
  (add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)


 General
 ----------------------------

 Mostly C# mode will "just work."  Use `describe-mode' to see the
 default keybindings and the highlights of the mode.


 Flymake Integration
 ----------------------------

 You can use flymake with csharp mode to automatically check the
 syntax of your csharp code, and highlight errors.  To do so, add a
 comment line like this to each .cs file that you use flymake with:

  //  flymake: c:\.net3.5\csc.exe /t:module /nologo /R:Foo.dll @@FILE@@

 That lines specifies a command "stub".  Flymake appends the name of
 the file to compile, and then runs the command to check
 syntax. Flymake assumes that syntax errors will be noted in the
 output of the command in a form that fits one of the regexs in the
 `compilation-error-regexp-alist-alist'. Check the flymake module for
 more information on that.

 Some rules for the command:

   1. it must appear all on a single line.

   2. csharp-mode generally looks for the marker line in the first N
      lines of the file, where N is set in
      `csharp-cmd-line-limit'.  See the documentation on that
      variable for more information.

   3. the command SHOULD use @@FILE@@ in place of the name of the
      source file to be compiled, normally the file being edited.
      This is because normally flymake saves a copy of the buffer
      into a temporary file with a unique name, and then compiles
      that temporary file. The token @@FILE@@ is replaced by
      csharp-mode with the name of the temporary file created by
      flymake, before invoking the command.

   4. The command should include /R options specifying external
      libraries that the code depends on.

 If you have no external dependencies, then you need not specify any
 flymake command at all. csharp-mode will implicitly act as if you had
 specified the command:

     // flymake: c:\.net3.5\csc.exe /t:module /nologo @@FILE@@


 If you use csc.exe as the syntax check tool (as almost everyone
 will), the /t:module is important. csharp-mode assumes that the
 syntax-check compile command will produce a file named
 NAME.netmodule, which is the default when using /t:module. (Remember
 than NAME is dynamically generated).  csharp-mode will remove the
 generated netmodule file after the syntax check is complete. If you
 don't specify /t:module, then csharp-mode won't know what file to
 delete.

 csharp-mode also fiddles with some other flymake things.  In
 particular it: adds .cs to the flymake "allowed filename masks";
 adds parsing for csc error messages; and adds advice to the error
 parsing logic. This all should be pretty benign for all other
 flymake buffers.  But it might not be.

 You can explicitly turn the flymake integration for C# off by
 setting `csharp-want-flymake-fixup' to nil.


 Compile Integration
 ----------------------------

 csharp-mode binds the function `csharp-invoke-compile-interactively'
 to "\C-x\C-e" .  This function attempts to intellgently guess the
 format of the compile command to use for a buffer.  It looks in the
 comments at the head of the buffer for a line that begins with
 compile: .  If found, csharp-mode suggests the text that follows as
 the compilation command when running `compile' .  If such a line is
 not found, csharp-mode falls back to a msbuild or nmake command.
 See the documentation on `csharp-cmd-line-limit' for further
 information.

 Also, csharp-mode installs an error regexp for csc.exe into
 `compilation-error-regexp-alist-alist', which allows `next-error'
 and `previous-error' (defined in compile.el) to navigate to the next
 and previous compile errors in the cs buffer, after you've run `compile'.


 YASnippet integration
 -----------------------------

 csharp-mode defines some built-in snippets for
 convenience.  For example, if statements, for, foreach, and
 so on.  You can see them on the YASnippet menu that is displayed
 when a csharp-mode buffer is opened.  csharp-mode defines this
 snippets happens only if ya-snippet is available. (It is done in an
 `eval-after-load' clause.)  The builtin snippets will not overwrite
 snippets that use the same name, if they are defined in the normal
 way (in a compiled bundle) with ya-snippet.

 You can explicitly turn off ya-snippet integration. See the var,
 `csharp-want-yasnippet-fixup'.


 imenu integration
 -----------------------------

 This should just work. For those who don't know what imenu is, it
 allows navigation to different points within the file from an
 "Index" menu, in the window's menubar.  csharp-mode computes the
 menu containing the namespaces, classes, methods, and so on, in the
 buffer.  This happens at the time the file is loaded; for large
 files it takes a bit of time to complete the scan.  If you don't
 want this capability, set `csharp-want-imenu' to nil.
