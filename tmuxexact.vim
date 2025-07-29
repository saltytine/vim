" ~/.vim/plugged/vim-airline-themes/autoload/airline/themes/tmuxexact.vim

scriptencoding utf-8

let g:airline#themes#tmuxexact#palette = {}

" tmux exact colors, map cterm color numbers + hex for gui
let s:bg = '#262626'       " cterm 235
let s:fg = '#d0d0d0'       " cterm 252

let s:win_active_bg = '#262626'  " cterm 65, mossy green for active window bg
let s:win_active_fg = '#000000'  " cterm 16, black fg

let s:gray1 = '#3a3a3a'     " cterm 238 muted gray
let s:gray2 = '#444444'     " cterm 239 dark gray

let s:yellow = '#d7af5f'
let s:cyan = '#5fafd7'
let s:red = '#af5f5f'
let s:magenta = '#af5faf'
let s:blue = '#5f87af'

" normal mode: status bar background = tmux status bg, fg = tmux status fg
let s:N1 = [ s:bg, s:fg, 252, 235 ]
" normal inactive = muted pane border
let s:N2 = [ s:fg, s:gray1, 252, 238 ]
let s:N3 = [ s:gray2, s:gray1, 250, 235 ]
let g:airline#themes#tmuxexact#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" insert mode: highlight with active window green bg + black fg
let s:I1 = [ s:win_active_bg, s:win_active_fg, 65, 235 ]
let s:I3 = [ s:gray2, s:bg, 250, 235 ]
let s:I2 = [ s:fg, s:gray1, 252, 238 ]
let g:airline#themes#tmuxexact#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" visual mode: same as insert but blue bg instead of green
let s:V1 = [ '#5f87af', '#000000', 66, 235 ]
let s:V3 = [ s:gray2, s:bg, 250, 235 ]
let s:V2 = [ s:fg, s:gray1, 252, 238 ]
let g:airline#themes#tmuxexact#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" command mode: yellow bg, black fg, makes it look kewl without being ugly
let s:C1 = [ s:yellow, '#000000', 179, 235 ]
let s:C3 = [ s:gray2, s:bg, 250, 235 ]
let s:C2 = [ s:fg, s:gray1, 252, 238 ]
let g:airline#themes#tmuxexact#palette.commandline = airline#themes#generate_color_map(s:C1, s:C2, s:C3)

" replace mode: red bg, black fg
let s:R1 = [ s:red, '#000000', 131, 235 ]
let g:airline#themes#tmuxexact#palette.replace = airline#themes#generate_color_map(s:R1, s:V2, s:V3)

" inactive mode: muted grays on bg, impossible to get to btw, literally not
" even sure that inactive mode exists anymore
let s:IA1 = [ s:gray2, s:bg, 239, 235 ]
let s:IA3 = [ s:gray2, s:bg, 250, 235 ]
let s:IA2 = [ s:gray2, s:bg, 239, 235 ]
let g:airline#themes#tmuxexact#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" accents
let g:airline#themes#tmuxexact#palette.accents = {
  \ 'red': [ s:red, '', 131, '' ],
  \ 'green': [ s:win_active_bg, '', 65, '' ],
  \ 'blue': [ '#5f87af', '', 66, '' ],
  \ 'yellow': [ s:yellow, '', 179, '' ],
  \ 'magenta': [ s:magenta, '', 133, '' ],
  \ 'cyan': [ s:cyan, '', 73, '' ]
  \ }

" overrides for modified/paste states
let pal = g:airline#themes#tmuxexact#palette
for mode in ['insert', 'replace', 'visual', 'inactive']
  exe "let pal.".mode."_modified = pal.".mode
  exe "let pal.".mode."_paste = pal.".mode
endfor

