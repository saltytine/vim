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

" ===========================
" TODO manager
" ===========================

let g:todo_file = expand('~/todo.md')

function! s:ToggleCheckbox() abort
  let l:line = getline('.')
  if l:line =~ '\[ \]'
    call setline('.', substitute(l:line, '\[ \]', '[x]', ''))
  elseif l:line =~ '\[x\]'
    call setline('.', substitute(l:line, '\[x\]', '[ ]', ''))
  endif
endfunction

function! s:SaveSection(header) abort
  if !filereadable(g:todo_file)
    call writefile([], g:todo_file)
  endif

  let l:lines = readfile(g:todo_file)
  let l:buflines = getline(1, '$')

  let l:new = []
  let l:in_section = 0
  let l:header_found = 0

  for lnum in range(len(l:lines))
    let l:line = l:lines[lnum]
    if l:line =~ '^# '
      if l:line ==# a:header
        call add(l:new, l:line)
        call extend(l:new, l:buflines[1:])
        let l:in_section = 1
        let l:header_found = 1
        continue
      elseif l:in_section
        call add(l:new, l:line)
        let l:in_section = 0
        continue
      endif
    endif
    if !l:in_section
      call add(l:new, l:line)
    endif
  endfor

  if !l:header_found
    call add(l:new, a:header)
    call extend(l:new, l:buflines[1:])
  endif

  call writefile(l:new, g:todo_file)
endfunction

function! s:OpenTodo(scope) abort
  if !filereadable(g:todo_file)
    call writefile([], g:todo_file)
  endif

  let l:lines = readfile(g:todo_file)

  if a:scope ==# 'file'
    let l:header = '# ' . expand('%:p')
  elseif a:scope ==# 'dir'
    let l:header = '# ' . expand('%:p:h')
  else
    let l:header = ''
  endif

  split __TODO__
  setlocal buftype=nofile bufhidden=wipe noswapfile
  setlocal modifiable

  if l:header !=# ''
    let l:start = -1
    for i in range(len(l:lines))
      if l:lines[i] =~ '^' . escape(l:header, '#/.\') . '$'
        let l:start = i
        break
      endif
    endfor

    if l:start >= 0
      let l:end = len(l:lines)
      for i in range(l:start+1, len(l:lines)-1)
        if l:lines[i] =~# '^# '
          let l:end = i
          break
        endif
      endfor
      call setline(1, l:lines[l:start : l:end-1])
    else
      call setline(1, [l:header, '- [ ] '])
    endif
  else
    call setline(1, l:lines)
  endif

  nnoremap <buffer> <CR> :call <SID>ToggleCheckbox()<CR>
  nnoremap <buffer> q :call <SID>CloseAndSave()<CR>
  nnoremap <buffer> <Esc> :call <SID>CloseAndSave()<CR>
endfunction

function! s:CloseAndSave() abort
  let l:buflines = getline(1, '$')
  if l:buflines[0] =~ '^# '
    let l:header = l:buflines[0]
    call s:SaveSection(l:header)
  endif
  bd!
endfunction

command! Todo    call s:OpenTodo('file')
command! Todor   call s:OpenTodo('dir')
command! Todoall call s:OpenTodo('all')

" ===========================

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
highlight Normal ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE

" tmux exact it my own custom theme made to match/look good with my
" .tmux.conf, see https://github.com/saltytine/tmux for that
" my custom airline theme will be included here
let g:airline_theme = 'tmuxexact'
