if !exists('g:vscode')

endif
set number 
set noswapfile 
syntax on

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
endif

inoremap jk <ESC>
nnoremap <SPACE> <Nop>
let mapleader = " "
set hlsearch 
set ignorecase 
set incsearch 


"lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }}


