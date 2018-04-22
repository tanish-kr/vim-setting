""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  ファイル関連
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

"バックアップファイル非作成
set nobackup
set noundofile
"エンコーディング
set fileencoding=utf-8
"改行コードをunixで保存
set fileformat=unix
" スペルチェック
set spell
if has("mac")
  set spelllang=en,cjk
endif
"ファイルブラウザで使用するディレクトリの場所
set browsedir=buffer

" ruby 速度改善
" let g:ruby_path="~/.rbenv/versions/2.3.1/bin/ruby"
" au BufNewFile, BufRead *.rb let g:ruby_path=system('rbenv prefix')
au BufNewFile, BufRead *.rb let g:ruby_path=system('which ruby')
