set nocompatible
syntax on
filetype plugin indent on

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

augroup folder_tabs
  autocmd!
  autocmd BufEnter ~/Coding/tivOS/* setlocal expandtab tabstop=2 shiftwidth=2
augroup END

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
" Plug 'morhetz/gruvbox'
" retrobox is just better :P
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vuciv/golf'

call plug#end()

" have c and cpp comments use // instead of /**/
autocmd FileType c,cpp setlocal commentstring=//\ %s

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
vnoremap <Tab> >gv
vnoremap <Leader><Tab> <gv
nnoremap <Leader><Left> gg
nnoremap <Leader><Right> G
nnoremap <C-Left> 0
nnoremap <C-Right> $
inoremap <C-Left> <C-o>0
inoremap <C-Right> <C-o>$
nnoremap <Leader>d :vsplit
" i'll prolly just use :Sex!
nnoremap <C-w> @w
" nnoremap o a
" nnoremap ii o
" nnoremap oo O
inoremap <Esc> <Esc>l
inoremap <C-c> <C-c>l
nnoremap <Leader>w :let @w = ''<CR>
" vnoremap mm gc, doesnt work for some reason
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
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-n>" : "\<S-Tab>"

" my crackpot scheme right here:
" so, shift z should mark a line, and then jump to it if a line is marked
" and then normal z unmarks a line
let g:marked_line = 0
nnoremap Z :if g:marked_line > 0 \| execute g:marked_line \| echo "" \| else \| let g:marked_line = line('.') \| echo "marked line ".g:marked_line \| endif<CR>
nnoremap z :let g:marked_line = 0 \| echo "mark cleared"<CR>
 
" colors
colorscheme retrobox
set background=dark

" tmux exact it my own custom theme made to match/look good with my
" .tmux.conf, see https://github.com/saltytine/tmux for that
" my custom airline theme will be included here
let g:airline_theme = 'tmuxexact'
