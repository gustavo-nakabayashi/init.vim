if !exists('g:vscode')

endif
set number 
set noswapfile 
set relativenumber
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
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'frazrepo/vim-rainbow'
	Plug 'matze/vim-move'


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


set nocompatible
filetype plugin on

" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'


nnoremap <C-p> :GFiles<Cr>
nnoremap <C-g> :Ag<Cr>
" Keep centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap . .<c-g>u
inoremap <space> <space><c-g>u
inoremap , ,<c-g>u
inoremap ! !<c-g>u



"lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }}


