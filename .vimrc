set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax checking
Plugin 'vim-syntastic/syntastic'

" Theme
Plugin 'KeitaNakamura/neodark.vim'

Plugin 'jceb/vim-orgmode'
" Needed for orgmode
Plugin 'tpope/vim-speeddating'
call vundle#end()            " required

filetype plugin indent on    " required

set hidden " Don't abandon hidden buffers
set encoding=utf-8
set magic " unbreak vim's regex implementation

" Enable relative line numbers (hybrid)
set number
set relativenumber
" https://jeffkreeftmeijer.com/vim-number/
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END


packloadall
silent! helptags ALL

" Set auto indet for orgmode
let g:org_indent = 1
let g:org_aggressive_conceal = 1
let g:org_heading_shade_leading_stars = 1

syntax enable

colorscheme neodark
" Use terminal background color
let g:neodark#use_256color = 1

