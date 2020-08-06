set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Syntax checking
Plugin 'vim-syntastic/syntastic'
" Git changes in a gutter on the left
Plugin 'airblade/vim-gitgutter'
" Simple statusline
Plugin 'vim-airline/vim-airline'
" Theme
Plugin 'KeitaNakamura/neodark.vim'
" Simple orgmode, not everything emacs can do
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

" Enable airline powerline
let g:airline_powerline_fonts = 1
" Show the buffers as a tabline at the top
let g:airline#extensions#tabline#enabled = 1

" Set auto indet for orgmode
let g:org_indent = 1
let g:org_aggressive_conceal = 1
let g:org_heading_shade_leading_stars = 1

syntax enable

colorscheme neodark
" Use terminal background color
let g:neodark#use_256color = 1

