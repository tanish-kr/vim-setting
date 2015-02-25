"インデント設定
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
""自動インデント
set smarttab
"行番号
set number
"現在のモード表示
set showmode
"ウィンドウのタイトルを変更
set title
"閉括弧に対応する括弧の強調表示
set showmatch
"シンタックスハイライト
set syntax=on
"タブ文字、空白文字、改行文字設定
set list
set listchars=tab:»-,trail:.,eol:¶,extends:»,precedes:«,nbsp:%
"全角スペースの表示
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
"ペーストモード
set paste
"バックアップファイル非作成
set nobackup
"エンコーディング
set fileencoding=utf-8
"改行コードをunixで保存
set fileformat=unix
"検索設定
"" 検索結果をハイライト
set hlsearch
""" ハイライトをEscでクリア
nnoremap <ESC><ESC> :nohlsearch<CR>
"" 末尾から再び検索
set wrapscan
"" 大文字と小文字を区別しない
set noignorecase
"行の折り返し
set wrap
"カーソル位置表示
set ruler
"コマンドライン補完拡張モード
set wildmenu
"ファイルブラウザで使用するディレクトリの場所
set browsedir=buffer
"クリップボード設定
""ビジュアルモードで選択したテキストをクリップボードに入れる
set clipboard+=autoselect
""yankしたテキストを*レジスタにも入れる
set clipboard+=unnamed

"neobundle設定
"Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
if &compatible
set nocompatible               " Be iMproved
endif

"" neobundleをruntimepathに追加
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
"" .vim/bundleを開始時に指定
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

call neobundle#end()

filetype plugin indent on

NeoBundle 'scrooloose/nerdtree'
NeoBundleCheck

"NERDTree自動設定
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
