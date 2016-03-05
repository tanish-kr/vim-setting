# Vim Setting
## .vim directory
- after  
  プラグインが読み込まれたあとに読み込まれるプラグインを格納
- autoload  
  機能を呼び出された時に、自動的に読み込まれるプラグインを格納
- colors  
  :colorscheme で呼び出される色定義ファイル
- compiler  
  :compiler で呼び出されるコンパイラのコマンドを定義したファイル
- dict  
  辞書保管用の辞書ファイルを格納
- doc  
  :help で呼び出されるVimやプラグインのヘルプファイル
- ftdetect  
  ファイルタイプを検出するVimスクリプトファイルを格納
- ftplugin  
  ファイルタイプごとに読み込まれるプラグインファイル
- indent  
  ファイルタイプごとに読み込まれるインデント情報を定義したファイル
- keymap  
  キーコードと入力する文字を対応付けるファイル
- lang  
  Vimのメッセージを書く言語に翻訳したファイル
- macros  
  自動的には読み込まれないVimスクリプトファイル。必要なときに直接読み込んで
- plugin  
  自動的に読み込まれるVimスクリプトファイル
- spell  
  スペルチェック用の辞書ファイル
- syntax  
  ファイルタイプごとのシンタックスハイライトを設定するVimスクリプトファイル
- tools  
  Vimで使用できるツール
- tutor  
  各言語に翻訳されたVimのチュートリアルが格納されている
    
## .vimrc 
### 基本設定
```vim
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
"set syntax=on
set syntax=enable
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
```

### neobundle設定
```vim
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
NeoBundle 'Shougo/neocomplete.vim'

NeoBundleCheck
```

#### NERDTree設定
```vim
"NERDTree自動設定
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
```

#### fugitive設定
```vim
"fugitive設定
"" grep検索の実行後にQuickFix Listを表示
autocmd QuickFixCmdPost *grep* cwindow
"" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
```

#### vim-indent-guides設定
```vim
" インデントの可視化
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=lightyellow
```

### vimrc分割
```vim
set runtimepath+=~/.vim
runtime! userautoload/*.vim
```

#### neobundle.vim設定
```vim
""" neocomplete setting
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
```

### dbext設定
db接続、補完、SQL実行が可能なvim plugin
```vim
" DBタイプを設定
let dbext_default_type='PGSQL|MYSQL|SQLITE|ORA'
" username
let dbext_default_user='username'
" password
let dbext_default_passwd='password'
" DB name
let dbext_default_dbname='dbname'
" host name
let dbext_default_host='hostname'
" port
let dbext_default_port='port'
" バッファに何行表示するか
let dbext_default_buffer_lines='bufferline'
" 履歴ファイルの設定
let dbext_default_history_file='sql history file'
" 履歴ファイルサイズの設定
let dbext_default_history_size='sql history size'
" 履歴ファイルへのエントリ数設定
let dbext_default_history_max_entry='sql history max entry'
" DB結果表示の最大行設定
let dbext_default_DBI_max_rows='DBI max rows'
" DB結果のでミリタ設定
let dbext_default_DBI_column_delimiter='\t'
```
