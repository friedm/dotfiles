set shell=bash

set nocompatible

set modelines=1
set background=dark

"tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"misc
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set wildignore=.git,*.class,*.o,*.a,*.obj,*.so,*.swp,*.pyc
set visualbell
set lazyredraw
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader=","

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1

nnoremap j gj
nnoremap k gk
nnoremap gV '[v']

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

au FocusLost * :wa

nnoremap <leader>v V`]
nnoremap <leader>ev <C-w>s<C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap <esc> <nop>
inoremap jk <ESC>

nnoremap <leader>w <C-w>s<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

syntax on

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/YankRing.vim'
Plug 'w0ng/vim-hybrid'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'rust-lang/rust.vim'

call plug#end()

nnoremap <S-j> :bprevious<cr>
nnoremap <S-k> :bnext<cr>

nnoremap <leader>N :enew<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>n :Files<cr>
nnoremap <leader>l :Lines<cr>
nnoremap <leader>a :Ag<space>
nnoremap <leader><enter> /{<cr>
nnoremap <leader><s-enter> ?{<cr>
nnoremap <leader>x :bd<cr>

highlight LineNr ctermfg=DarkGrey

hi TabLine guifg=#333 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none
hi TabLineSel guifg=#666 guibg=#222 gui=bold ctermfg=231 ctermbg=235 cterm=bold
hi TabLineFill guifg=#999 guibg=#222 gui=none ctermfg=254 ctermbg=238 cterm=none

function! Tabline()
	let s = ''
	for i in range(tabpagenr('$'))
		let tab = i + 1
		let winnr = tabpagewinnr(tab)
		let buflist = tabpagebuflist(tab)
		let bufnr = buflist[winnr - 1]
		let bufname = bufname(bufnr)
		let bufmodified = getbufvar(bufnr, "&mod")

		let s .= '%' . tab . 'T'
		let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
		let s .= (bufname != '' ? ' '. fnamemodify(bufname, ':t') . ' ' : '[No Name] ')

		if bufmodified
			let s .= '[+] '
		endif
	endfor

	let s .= '%#TabLineFill#'
	return s
endfunction
set tabline=%!Tabline()

let g:yankring_history_dir = '~/.yr'

colorscheme hybrid
highlight Cursor guifg=white guibg=black
