" Encoding
set encoding=utf-8
set fileencoding=utf-8

" Plugins
"" Vundle configuration
filetype off
set rtp+=$HOME/.nix-profile/share/vim-plugins/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"" Theme
Plugin 'fatih/molokai'
"" Bottom line
Plugin 'itchyny/lightline.vim'
" Automatic comment
Plugin 'tpope/vim-commentary'
call vundle#end()


" Color activation
syntax enable
let g:molokai_original=1
colorscheme molokai

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Settings
filetype on
filetype plugin on
filetype indent on

" Makes backspace sane
set backspace=indent,eol,start

" Mouse support
set mouse=a

" Indentation
set tabstop=4
set shiftwidth=4

set noerrorbells
set novisualbell
set number
set autoindent

" Split
set splitbelow
set splitright


" Status line
set laststatus=2 " Always show the status line
set showcmd

" Drop home message
set shortmess=I
