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
" au BufNewFile, BufRead *.rb let g:ruby_path=system('which ruby')
au BufNewFile,BufRead *.rb let g:ruby_path=system('echo $HOME/.anyenv/envs/rbenv/shims')
au BufRead,BufNewFile *.thor set filetype=ruby

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Explore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_liststyle = 3
" バナー削除
let g:netrw_banner = 0
" 縦に開いておく
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" 幅
let g:netrw_winsize = 15
" Project Drawer
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END
"augroup VimStartup
"  au!
"  au VimEnter * if expand("%") == "" | e . | endif
"augroup END
" create newfileで新規bufferに開く
autocmd filetype netrw call Netrw_mappings()
function! Netrw_mappings()
  "noremap <buffer>% :call CreateInPreview()<cr>
  noremap <buffer>n :call CreateInPreview()<cr>
endfunction
function! CreateInPreview()
  let l:filename = input("please enter filename: ")
  "execute 'pedit ' . b:netrw_curdir.'/'.l:filename
  execute 'tabe' . b:netrw_curdir.'/'.l:filename
endfunction
