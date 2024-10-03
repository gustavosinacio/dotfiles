let mapleader=" "
let maplocalleader=" "

set expandtab
set tabstop=3
set softtabstop=2
set shiftwidth=2

set hlsearch "-- Highlight search results
set incsearch "-- Incremental search
set ignorecase "-- Ignore case in search patterns
set smartcase "-- Override ignorecase if search pattern contains uppercase letters
set nowrap "-- Disable line wrap
set termguicolors "-- Enable true color support

set textwidth=0
set wrapmargin=0
set linebreak "--optional - breaks by word rather than character
"set wrap

set number "-- Make line numbers default
set relativenumber
set showtabline=2
set sessionoptions="curdir,folds,globals,help,tabpages,terminal,winsize"
set splitright
set splitbelow

"set noshowmode "-- Don't show the mode, since it's already in the status line

set cursorline " show current line with visual hightlight

set undofile

"set cursorbind - These are usefull for comparing files
"set scrollbind

set conceallevel=0

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

set colorcolumn=81,121
"hi colorcolumn guibg='#202020'

set breakindent
set timeoutlen=400

set fixendofline
set fixeol
set scrolloff=8

set mouse=  "-- Enable mouse mode, can be useful for resizing splits for example!

set updatetime=450 "-- Decrease update time

set foldmethod=expr
set foldlevel=20
set foldexpr=nvim_treesitter#foldexpr()

" set vim to not try to look and behave like vi
set nocompatible

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
"let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_liststyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()

":helpgrep with grep goes into the quicklist

" -- Keymaps ---------------------------------------
nnoremap <leader>tt <cmd>Explore<CR>
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <Esc> <cmd>nohlsearch<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz

nnoremap J mzJ`z

nnoremap <Tab> <cmd>bnext<CR>
nnoremap <S-Tab> <cmd>bprev<CR>
nnoremap <leader>x <cmd>bdelete<CR>
nnoremap <leader>rX <cmd>bdelete!<CR>
nnoremap <leader><leader>x <cmd>w<CR><cmd>source %<CR>

nnoremap <left> <cmd>echo "Use h to move!!"<CR>
nnoremap <right> <cmd>echo "Use l to move!!"<CR>
nnoremap <up> <cmd>echo "Use k to move!!"<CR>
nnoremap <down> <cmd>echo "Use j to move!!"<CR>

xnoremap <leader>p "_dP

vnoremap K <cmd>m '<-2<CR>gv=gv
vnoremap J <cmd>m '>+1<CR>gv=gv

nnoremap <leader>n <cmd>cnext<CR>
nnoremap <leader>p <cmd>cprev<CR>

nnoremap <leader>tt <cmd>Ex<CR>

nnoremap <C-f> <cmd>silent !tmux neww tmwnizer<CR>
" --------------------------------------------------


"colorscheme zaibatsu
colorscheme lunaperche
