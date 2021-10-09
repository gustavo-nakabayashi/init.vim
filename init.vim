if !exists('g:vscode')

endif
set number 
set noswapfile 
syntax on
set nocompatible
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin("~/.nvim/plugged")
	Plug 'kaicataldo/material.vim', { 'branch': 'main' }
	Plug 'vim-syntastic/syntastic'
	Plug 'nvie/vim-flake8'
  	Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
"	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
	Plug 'morhetz/gruvbox'
"	Plug 'sheerun/vim-polyglot'
	Plug 'joshdick/onedark.vim'
	Plug 'tpope/vim-surround'
call plug#end()
let g:semshi#simplify_markup = "false"
let g:material_terminal_italics = 1
let g:material_theme_style = 'darker'
colorscheme onedark

inoremap jk <ESC>
nnoremap <SPACE> <Nop>
let mapleader = " "
set hlsearch 
set ignorecase 
set incsearch 
"Search down into subfolders in tab completion
set path+=**
"Display all matching files when we tab complete
set wildmenu
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader><C-p> :find 
"lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }}


