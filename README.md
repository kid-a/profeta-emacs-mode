profeta-emacs-mode
==================

Description
-----------


Installation
------------
To install profeta-emacs-mode, put `profeta-mode.el` into one of the directories 
listed in your Emacs `load-path` (to see which directories are in your `load-path`, 
type C-h v load-path in Emacs).

Then, open your Emacs initialization file (it is usually a file names `.emacs` in 
your home directory; to check this, type C-h v user-init-file) and add the 
following lines:

    (autoload 'profeta-mode "profeta-mode.el"
     "Major mode for editing PROFETA strategies." t)

Altenatively, if you did not save `profeta-mode.el` into one of the directories listed 
in `load-path`, replace "profeta-mode.el" with the full pathname.