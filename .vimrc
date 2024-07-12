" from https://youtu.be/XA2WjJbmmoM

" set vim to not try to look and behave like vi
set nocompatible

set number
set relativenumber

" suposably adds syntax. Could not see any change from vanilla
syntax enable

" tecnically a plugin, but ships with vim
filetype plugin on

" search down into subfolders
" Provides tab-completion
" When doing this, he used `:set path?` to see the variable info
" This actually works and its fucking amazing
" It works with * completion like *.go
set path+=**

" This is suppose to change the menu style, but it didn't work
set wildmenu

" Autocomplete works out of the box
" It is documented inside in |ins-completion|
"
" ^x^n for just this file
" ^x^f for filenames (works with the ** on path that was set previously
" ^x^] for tags only
" ^n for anything specified by the 'complete' option

" File browsing
let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_liststyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()

"This will enable spelling autocomplete only when spell is enabled on my buffer
"This means that when I'm in insert mode and I press ^p i will be
"presented with a dictionary auto complete.
" To turn spell on/off:
" :set spell
" :set nospell
set complete+=kspell


":cn :cp for next and prev
"
":helpgrep with grep goes into the quicklist


colorscheme koehler
