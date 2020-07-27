set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Theme
Plugin 'KeitaNakamura/neodark.vim'

Plugin 'jceb/vim-orgmode'
" Needed for orgmode
Plugin 'tpope/vim-speeddating'
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

packloadall
silent! helptags ALL

" Don't abandon hidden buffers
set hidden

" Set auto indet for orgmode
let g:org_indent = 1
let g:org_aggressive_conceal = 1
let g:org_heading_shade_leading_stars = 1

syntax enable

colorscheme neodark

