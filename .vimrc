set t_Co=256

set ai "auto indenting
syntax on "syntax highlighting
set tabstop=4 "a tab is four spaces
set softtabstop=4 "when hitting <BS>, pretend like a tab is removed, even if spaces 
set expandtab "expand tabs to spaces by default 
set shiftwidth=4 "number of spaces to use for autoindenting
set mouse+=a
set autoindent
set wildmenu
set showmatch
"Change the leader key
let mapleader = ","

"folding settings 
set foldenable "fold by default 
set foldmethod=indent "fold based on indent 
set foldnestmax=10 "deepest fold is 10 levels 
set foldlevelstart=10 "this is just what i use

set guifont=Monaco:h10 noanti
colorscheme jellybeans

let g:jellybeans_overrides = { 
			\    'background': { 'guibg': '000000' }, 
			\}

let g:jellybeans_overrides = { 
			\    'Todo': { 'guifg': '303030', 'guibg': 'f0f000', 
			\              'ctermfg': 'Black', 'ctermbg': 'Yellow', 
			\              'attr': 'bold' }, 
			\    'Comment': { 'guifg': 'cccccc' }, 
			\}

let g:jellybeans_overrides = { 
			\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' }, 
			\} 
if has('termguicolors') && &termguicolors     

	let g:jellybeans_overrides['background']['guibg'] = 'none' 
endif

"Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'frazrepo/vim-rainbow'

Plug 'tpope/vim-surround' 
"Initialize plugin system 
call plug#end()

"Allows for commenting
filetype plugin on

set laststatus=2

let g:lightline = {
			\'colorscheme': 'jellybeans',
			\}

"turn hybrid line numbers on
set number relativenumber
augroup numbertoggle
   autocmd!
   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber 
augroup END


""Control P
let g:ctrlp_map = '<c-p>' 
let g:ctrlp_cmd = 'CtrlP'

map <c-t> :NERDTreeToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>
