set nocompatible
syntax on
filetype plugin indent on

set guicursor=n-v-c:block,i:ver25

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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vuciv/golf'
Plug 'junegunn/fzf.vim'
Plug 'saltytine/BQN', {'rtp': 'editors/vim'}
Plug 'saltytine/todo-by-file'
Plug 'saltytine/marked'
Plug 'saltytine/live-reference'
" instead of using coc (because of the cursor problems, use control p and live-reference)

call plug#end()

" have c and cpp comments use // instead of /**/
autocmd FileType c,cpp,swift setlocal commentstring=//\ %s

" keymaps
nnoremap <Leader>k <C-w>k
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>l <C-w>l

vnoremap <A-Up> :m '<-2<CR>gv=gv
vnoremap <A-Down> :m '>+1<CR>gv=gv

nmap <Leader>ff :Files<CR>
nmap <Leader>fg :Rg
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

" colors
colorscheme retrobox
set background=dark
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" tmux exact it my own custom theme made to match/look good with my
" .tmux.conf, see https://github.com/saltytine/tmux for that
" my custom airline theme will be included here
let g:airline_theme = 'tmuxexact'
