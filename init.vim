if !exists('g:vscode')
	set number 
	set noswapfile 
	set relativenumber
	syntax on



	let g:semshi#simplify_markup = "false"
	let g:material_terminal_italics = 1
	let g:material_theme_style = 'darker'
	let g:gruvbox_contrast_dark= 'hard'
	colorscheme gruvbox
	let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{','}']]
	let g:netrw_preview = 1
	"Search down into subfolders in tab completion
	set path+=**
	"Display all matching files when we tab complete
	set wildmenu

	set nocompatible
	filetype plugin on

	" FILE BROWSING

	" Tweaks for browsing
	let g:netrw_banner=0        " disable annoying banner
	let g:netrw_browse_split=4  " open in prior window
	let g:netrw_altv=1          " open splits to the right
	let g:netrw_liststyle=3     " tree view
	let g:netrw_list_hide=netrw_gitignore#Hide()
	let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"	FZF
	nnoremap <C-p> :Files<Cr>
	nnoremap <C-g> :Ag<Cr>


	inoremap . .<c-g>u
	inoremap <space> <space><c-g>u
	inoremap , ,<c-g>u
	inoremap ! !<c-g>u

endif

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
	"VSCode as well
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-sensible'
	Plug 'tpope/vim-fugitive'
	Plug 'matze/vim-move'
	Plug 'takac/vim-hardtime'

	"Vim only
	if(!exists('g:vscode'))
	"Themes
		Plug 'kaicataldo/material.vim', { 'branch': 'main' } "Theme community material
		Plug 'joshdick/onedark.vim'
		Plug 'morhetz/gruvbox'

	"Syntax highlight
		Plug 'vim-syntastic/syntastic'
		Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
	"	Plug 'sheerun/vim-polyglot'
	"	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
		Plug 'pangloss/vim-javascript'
		
	"GUI Stuff
		Plug 'vim-airline/vim-airline'
		Plug 'mhinz/vim-signify'
		Plug 'junegunn/rainbow_parentheses.vim'
		Plug 'Yggdroot/indentLine'

	"Others
		Plug 'nvie/vim-flake8'
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'
	"Javascript
		Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
	endif
call plug#end()


let g:hardtime_default_on = 1
nnoremap <SPACE> <Nop>
let mapleader = " "
set hlsearch 
set ignorecase 
set incsearch 
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

if has('clipboard') || exists('g:vscode')
    set clipboard^=unnamed

    if has('nvim') && exists('$WSLENV')
        let g:clipboard = {
            \ 'name': 'win32yank-wsl',
            \ 'copy': {
            \    '+': 'win32yank.exe -i --crlf',
            \    '*': 'win32yank.exe -i --crlf',
            \  },
            \ 'paste': {
            \    '+': 'win32yank.exe -o --lf',
            \    '*': 'win32yank.exe -o --lf',
            \ },
            \ 'cache_enabled': 0,
        \ }
    endif
endif
 

" Keep centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

"lua require'nvim-treesitter.configs'.setup { highlight = { enable = true }}


