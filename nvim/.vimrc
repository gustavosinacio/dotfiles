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
set cursorline "-- Highlight the current line
set termguicolors "-- Enable true color support
set signcolumn=yes "-- Always show the sign column

set number "-- Make line numbers default
set relativenumber
set showtabline=2
set sessionoptions="curdir,folds,globals,help,tabpages,terminal,winsize"
set splitright
set splitbelow

set inccommand=split " Preview substitutions live, as you type!

"set noshowmode "-- Don't show the mode, since it's already in the status line

set cursorline " show current line with visual hightlight

set undofile

"set cursorbind - These are usefull for comparing files
"set scrollbind

set conceallevel=0

set path+=**

let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_winsize = 25

set signcolumn=yes:2
set colorcolumn=81,121
hi colorcolumn guibg='#202020'

set breakindent
set timeoutlen=200

set fixendofline
set fixeol
set scrolloff=8

set mouse=a "-- Enable mouse mode, can be useful for resizing splits for example!

set updatetime=450 "-- Decrease update time

set foldmethod=expr
set foldlevel=20
set foldexpr=nvim_treesitter#foldexpr()
