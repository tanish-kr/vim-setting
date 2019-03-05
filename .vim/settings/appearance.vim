""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 外観設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

"行番号
set number
"現在のモード表示
set showmode
"ウィンドウのタイトルを変更
set title
"終了時にターミナルのタイトルを戻す
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"
"閉括弧に対応する括弧の強調表示
set showmatch
"タブ文字、空白文字、改行文字設定
set list
if has("mac")
  " mac では段落記号が全角でしか認識しないため
  set listchars=tab:»-,trail:.,eol:↲,extends:»,precedes:«,nbsp:%
elseif has("unix")
  set listchars=tab:»-,trail:.,eol:¶,extends:»,precedes:«,nbsp:%
endif

" カーソル行可視化
set cursorline
"行の折り返し
set wrap
"カーソル位置表示
set ruler

"カラーテーマ
set t_Co=256
if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

set background=dark
autocmd ColorScheme * highlight Visual term=reverse cterm=reverse ctermfg=230 ctermbg=238 gui=reverse guifg=#ffffd7 guibg=#444444
autocmd ColorScheme  * highlight LineNr term=underline ctermfg=195 ctermbg=242 guifg=#d7ffff guibg=#666666
colorscheme atom_dark
" colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ZenkakuSpace()
   highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray gui=reverse guifg=DarkGray
endfunction
if has('syntax')
   augroup ZenkakuSpace
       autocmd!
       autocmd ColorScheme * call ZenkakuSpace()
       autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
   augroup END
   call ZenkakuSpace()
endif
