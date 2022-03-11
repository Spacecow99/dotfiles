syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'mkitt/tabline.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'preservim/nerdtree'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'

Bundle 'jistr/vim-nerdtree-tabs'

"Plugin 'davidhalter/jedi-vim'
" All of your Plugins must be added before this line
call vundle#end()            " required
filetype plugin indent on    " required
" Open tagbar automatically in C files, optional
autocmd FileType c call tagbar#autoopen(0)
" Open tagbar automatically in Python files, optional
autocmd FileType python call tagbar#autoopen(0)
" Show status bar, optional
set laststatus=2
" Set status as git status (branch), optional
set statusline=%{FugitiveStatusline()}
" Set colour to Molokai
colorscheme Monokai
" Turn on line numbers
set number
" Set 80 line column
set colorcolumn=81
" Syntastic defaults
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set showtabline=2

let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1

