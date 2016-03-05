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
"終了時にターミナルのタイトルを戻す
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"
"閉括弧に対応する括弧の強調表示
set showmatch
"シンタックスハイライト
"set syntax=on
set syntax=enable
" 折りたたみ
set foldenable
set foldmethod=syntax

autocmd InsertEnter * if !exists('w:last_fdm')
            \| let w:last_fdm=&foldmethod
            \| setlocal foldmethod=manual
            \| endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm')
            \| let &l:foldmethod=w:last_fdm
            \| unlet w:last_fdm
            \| endif

"タブ文字、空白文字、改行文字設定
set list
" set listchars=tab:»-,trail:.,eol:¶,extends:»,precedes:«,nbsp:%
" mac では段落記号が全角でしか認識しないため
set listchars=tab:»-,trail:.,eol:↲,extends:»,precedes:«,nbsp:%
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
set noundofile
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
"set clipboard+=autoselect
""yankしたテキストを*レジスタにも入れる
set clipboard+=unnamed
"カラーテーマ
" set term=builtin_linux
" set ttytype=builtin_linux
set t_Co=256
set background=dark
colorscheme atom_dark
"colorscheme Tomorrow-Night-Bright
"colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" splitキーバインド
" nnoremap s <Nop>
" "" 画面移動
" nnoremap sj <C-w>j
" nnoremap sk <C-w>k
" nnoremap sl <C-w>l
" nnoremap sh <C-w>p
" "" 画面サイズ変更
" nnoremap s> <C-w>>
" nnoremap s< <C-w><
" nnoremap s= <C-w>=
" nnoremap s+ <C-w>+
" nnoremap s- <C-w>-
" "" 画面入れ替え
" nnoremap sH <C-w>H
" nnoremap sJ <C-w>J
" nnoremap sK <C-w>K
" nnoremap sL <C-w>L
" nnoremap sr <C-w>r

" ruby 速度改善
let g:ruby_path="~/.rbenv/versions/2.2.1/bin/ruby"

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

" install neobundle
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/dbext.vim'
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/vimproc.vim',{
\ 'build' : {
\   'cygwin' : 'make -f make_cygwin.mak',
\   'mac' : 'make -f make_mac.mak',
\   'linux' : 'make',
\   'unix' : 'gmake',
\   },
\}

NeoBundleCheck


"NERDTree自動設定
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"fugitive設定
"" grep検索の実行後にQuickFix Listを表示
autocmd QuickFixCmdPost *grep* cwindow
"" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" インデントの可視化
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=lightgrey ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=lightyellow ctermbg=lightyellow

" vimshell
let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '

" syntax check
"" rubocopは常に最新のrubyから実行する
"let g:syntastic_ruby_rubocop_exec = '~/.rbenv/versions/2.2.1/bin/rubocop'
"let g:syntastic_ruby_checkers = ['rubocop']
""" pep8はインストールされているversionを指定しておく
"let g:syntastic_python_pep8_exec = '~/.pyenv/versions/3.4.2/bin/pep8'
"let g:syntastic_python_checkers = ['pep8']
set runtimepath+=~/.vim
runtime! userautoload/*.vim
