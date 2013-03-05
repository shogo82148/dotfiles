markdown-mode is a major mode for editing [Markdown][]-formatted
text files in GNU Emacs.  markdown-mode is free software, licensed
under the GNU GPL.

 [Markdown]: http://daringfireball.net/projects/markdown/

The latest stable version is markdown-mode 1.8.1, released on August 15, 2011:

   * [markdown-mode.el][]
   * [Screenshot][]
   * [Release notes][]

 [markdown-mode.el]: http://jblevins.org/projects/markdown-mode/markdown-mode.el
 [screenshot]: http://jblevins.org/projects/markdown-mode/screenshots/20110812-001.png
 [release notes]: http://jblevins.org/projects/markdown-mode/rev-1-8-1

markdown-mode is also available in several package managers, including:

   * Debian and Ubuntu Linux: [emacs-goodies-el][]
   * RedHat and Fedora Linux: [emacs-goodies][]
   * OpenBSD: [textproc/markdown-mode][]
   * Arch Linux (AUR): [emacs-markdown-mode-git][]

 [emacs-goodies-el]: http://packages.debian.org/emacs-goodies-el
 [emacs-goodies]: https://admin.fedoraproject.org/pkgdb/acls/name/emacs-goodies
 [textproc/markdown-mode]: http://pkgsrc.se/textproc/markdown-mode
 [emacs-markdown-mode-git]: http://aur.archlinux.org/packages.php?ID=30389

The latest development version can be downloaded directly
([markdown-mode.el][devel.el]) or it can be obtained from the
(browsable and clonable) Git repository at
<http://jblevins.org/git/markdown-mode.git>.  The entire repository,
including the full project history, can be cloned via the Git protocol
by running

    git clone git://jblevins.org/git/markdown-mode.git

 [devel.el]: http://jblevins.org/git/markdown-mode.git/plain/markdown-mode.el

Dependencies:

markdown-mode requires easymenu, a standard package since GNU Emacs
19 and XEmacs 19, which provides a uniform interface for creating
menus in GNU Emacs and XEmacs.

Installation:

Make sure to place `markdown-mode.el` somewhere in the load-path and add
the following lines to your `.emacs` file to associate markdown-mode
with `.text` files:

    (autoload 'markdown-mode "markdown-mode"
       "Major mode for editing Markdown files" t)
    (setq auto-mode-alist
       (cons '("\\.text" . markdown-mode) auto-mode-alist))

There is no consensus on an official file extension so change `.text` to
`.mdwn`, `.md`, `.mdt`, or whatever you call your markdown files.

Customization:

Although no configuration is *necessary* there are a few things
that can be customized.  The `M-x customize-mode` command
provides an interface to all of the possible customizations:

  * `markdown-command' - the command used to run Markdown (default:
    `markdown').  This variable may be customized to pass
    command-line options to your Markdown processor of choice, but
    this command must accept input from `stdin`.  If it does not, a
    simple wrapper script can be used to write `stdin` to a file
    and then pass that file to your Markdown interpreter.  Ideally,
    this command will produce an XHTML fragment around which
    markdown-mode will wrap a header and footer (which can be
    further customized).  However, it attempts to detect whether
    the command produces standalone XHTML output (via
    `markdown-xhtml-standalone-regexp'), in which case no header
    and footer content will be added.

  * `markdown-command-needs-filename' - set to non-nil if
    `markdown-command' does not accept input from stdin (default: nil).
     Instead, it will be passed a filename as the final command-line
     option.  As a result, you will only be able to run Markdown
     from buffers which are visiting a file.

  * `markdown-hr-string' - string to use when inserting horizontal
    rules (default: `* * * * *').

  * `markdown-bold-underscore' - set to a non-nil value to use two
    underscores for bold instead of two asterisks (default: `nil').

  * `markdown-italic-underscore' - set to a non-nil value to use
    underscores for italic instead of asterisks (default: `nil').

  * `markdown-indent-function' - the function to use for automatic
    indentation (default: `markdown-indent-line').

  * `markdown-indent-on-enter' - set to a non-nil value to
    automatically indent new lines when the enter key is pressed
    (default: `t')

  * `markdown-follow-wiki-link-on-enter' - set to a non-nil value
    to automatically open a linked document in a new buffer if the
    cursor is an wiki link
    (default: `t')

  * `markdown-wiki-link-alias-first' - set to a non-nil value to
    treat aliased wiki links like `[[link text|PageName]]`.
    When set to nil, they will be treated as `[[PageName|link text]]'.

  * `markdown-uri-types' - a list of protocols for URIs that
    `markdown-mode' should highlight.

  * `markdown-enable-math' - syntax highlighting for
    LaTeX fragments (default: `nil').

  * `markdown-css-path' - CSS file to link to in XHTML output.

  * `markdown-xhtml-header-content' - additional content to include
    in the XHTML `<head>` block.

  * `markdown-xhtml-standalone-regexp' - a regular expression which
    indicates whether the output of `markdown-command' is standalone
    XHTML (default: `^\\(\<\?xml\\|\<!DOCTYPE\\|\<html\\)`).  If
    this is not matched, we assume this output is a fragment and add
    our own header and footer.

  * `markdown-link-space-sub-char' - a character to replace spaces
    when mapping wiki links to filenames (default: `_`).
    For example, use an underscore for compatibility with the
    Python Markdown WikiLinks extension or a hyphen for compatibility
    with Github wiki links.

Additionally, the faces used for syntax highlighting can be modified to
your liking by issuing `M-x customize-group RET markdown-faces`
or by using the "Markdown Faces" link at the bottom of the mode
customization screen.
