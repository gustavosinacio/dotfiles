set hlsearch "-- Highlight search results
set incsearch "-- Incremental search
set ignorecase "-- Ignore case in search patterns
set smartcase "-- Override ignorecase if search pattern contains uppercase letters
set nowrap "-- Disable line wrap

set number "-- Make line numbers default
set relativenumber
set showtabline=2

set cursorline " show current line with visual hightlight

set colorcolumn=81,121
"hi colorcolumn guibg='#202020'

set breakindent

set fixendofline
set fixeol
set scrolloff=10

" set vim to not try to look and behave like vi
set nocompatible

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <Esc> :nohl<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap G Gzz
nnoremap j jzz
nnoremap k kzz
nnoremap H Hzz
nnoremap L Lzz

nnoremap J mzJ`z
