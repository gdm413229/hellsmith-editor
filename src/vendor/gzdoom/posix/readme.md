This directory contains files required to support POSIX-compatible OSes, like GNU/Linux, OS X or BSD.  

Common files are placed in this directory directly.  
SDL backend files are in `sdl` subdirectory.  Not used by the Hellsmith editor.
Native OS X backend files are in `cocoa` subdirectory.  This editor is a Linux-exclusive tool, so these files aren't used.
Shared files for both OS X backends are in `osx` subdirectory.  Same as the `cocoa` subdir.  Not used.
The Hellsmith editor-exclusive GTK backend files are in the `gtk` subdir.
