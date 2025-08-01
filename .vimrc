set nocompatible
syntax on
filetype plugin indent on

" i made the cursor stop blinking, although this might be kitty specific, if
" you want smth for another terminal emulator or terminal and this doesnt
" work, you might have to find a different way to go about it
let &t_SI = "\e[2 q"
let &t_EI = "\e[2 q"

set number
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set hidden
set nowrap
set cursorline
set noswapfile
set scrolloff=8
set mouse=a
set guicursor=
set clipboard=unnamedplus
set splitright

set wildmenu
set incsearch
set hlsearch
set ignorecase
set smartcase

set autoindent
set tabstop=4 shiftwidth=4 expandtab

" leader is the good old space bar
let mapleader = " "

" plugin manager
" coc.nvim requires npm, you can install lsps with :CocInstall coc-[lsp-here]
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" keymaps
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l

vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

nmap <Leader>ff :Files<CR>
nmap <Leader>fg :GFiles<CR>
nmap <Leader>fb :Buffers<CR>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>gs :G<CR>
vnoremap <Tab> >gv
vnoremap <Leader><Tab> <gv
nnoremap <Leader><Up> gg
nnoremap <Leader><Down> G
nnoremap <C-Left> 0
nnoremap <C-Right> $
inoremap <C-Left> <C-o>0
inoremap <C-Right> <C-o>$
nnoremap <Leader>d :vsplit
nnoremap <C-w> @w
" nnoremap o a
" nnoremap ii o
" nnoremap oo O
inoremap <Esc> <Esc>l
inoremap <C-c> <C-c>l
nnoremap <Leader>w :let @w = ''<CR>
vnoremap mm gc, doesnt work for some reason
vnoremap <Tab> >gv
vnoremap <Leader><Tab> <gv
nnoremap <Leader><Up> gg
vnoremap <Leader><Up> gg
nnoremap <Leader><Down> G
vnoremap <Leader><Down> G
vnoremap <C-Left> 0
vnoremap <C-Right> $
nnoremap n <Nop>
nnoremap m <Nop>
vnoremap y "+y
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" colors
colorscheme retrobox
set background=dark

" tmux exact it my own custom theme made to match/look good with my
" .tmux.conf, see https://github.com/saltytine/tmux for that
" my custom airline theme will be included here
let g:airline_theme = 'tmuxexact'
