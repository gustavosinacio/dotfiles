set expandtab
set tabstop=3
set softtabstop=2
set shiftwidth=2

set hlsearch "-- Highlight search results
set incsearch "-- Incremental search
set ignorecase "-- Ignore case in search patterns
set smartcase "-- Override ignorecase if search pattern contains uppercase letters
set nowrap "-- Disable line wrap
set cursorline "-- Highlight the current line
set termguicolors "-- Enable true color support
set signcolumn=yes "-- Always show the sign column

set number "-- Make line numbers default
set relativenumber
set showtabline=2
set sessionoptions="curdir,folds,globals,help,tabpages,terminal,winsize"

"set mouse=a "-- Enable mouse mode, can be useful for resizing splits for example!

set noshowmode "-- Don't show the mode, since it's already in the status line

"set cursorbind - These are usefull for comparing files
"set scrollbind

set conceallevel=0

set path+=**

let g:netrw_banner=0
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

"let g:netrw_altv=1
"let g:netrw_browse_split=0
"let g:netrw_liststyle=1 "3 is tree style, 0 is default

set signcolumn=yes:2
set colorcolumn=81,121
hi colorcolumn guibg='#202020'
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25
