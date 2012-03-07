set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'hughbien/md-vim'
Bundle 'ervandew/supertab'
Bundle 'wincent/Command-T'
Bundle 'scrooloose/nerdcommenter'
Bundle 'bsl/obviousmode'
Bundle 'tpope/vim-surround'
Bundle 'godlygeek/tabular'

syntax on
filetype plugin on
filetype plugin indent on
set ts=2 
set sw=2 
set expandtab
au BufNewFile,BufRead *.md set ft=md
let mapleader=','
set history=1000
set title
set scrolloff=5
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/tmp

