set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Syntax checking
Plugin 'vim-syntastic/syntastic'
" Support for a editorconfig file
Plugin 'editorconfig/editorconfig-vim'
" Fuzzy search for files
Plugin 'ctrlpvim/ctrlp.vim'
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

" Rainbow colors for csv
Plugin 'mechatroner/rainbow_csv'
" All you need for go in vim
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Git wrapper
Plugin 'tpope/vim-fugitive'
" TOML support for vim
Plugin 'cespare/vim-toml'
" Hashicorp config language support
Plugin 'jvirtanen/vim-hcl'
" Graphql support
Plugin 'jparise/vim-graphql'

" Spell checking
Plugin 'dpelle/vim-LanguageTool'
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

" Basic settings for syntastic
" https://github.com/vim-syntastic/syntastic#3-recommended-settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set hlsearch    " highlight all search results
set incsearch   " show incremental search results as you type

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

" Set default spelling language
set spelllang=en_GB

autocmd Filetype markdown setlocal tw=100 ts=4 sw=4 sts=4
autocmd FileType yaml setlocal et ts=2 sw=2
autocmd FileType hcl setlocal et ts=2 sw=2
autocmd BufRead,BufNewFile *.js setlocal et ts=2 sw=2
autocmd BufRead,BufNewFile *.ts setlocal et ts=2 sw=2

" Set fzf runtime
set rtp+=/usr/local/opt/fzf
