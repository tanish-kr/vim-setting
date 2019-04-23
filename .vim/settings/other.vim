set nocompatible
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" 検索結果をハイライト
set hlsearch
"" 末尾から再び検索
set wrapscan
"" 大文字と小文字を区別しない
set noignorecase

"" 自動的にquickfix-windowを開く
autocmd QuickFixCmdPost *grep* cwindow

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 補完
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"コマンドライン補完拡張モード
set wildmenu
"シンタックスハイライト
" set syntax=on
syntax enable
" ファイルタイプでのインデント有効
filetype plugin indent on
" オムニ補完有効
set omnifunc=syntaxcomplete#Complete
" ユーザ補完
set completefunc=syntaxcomplete#Complete

" html閉じタグ自動補完
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" テンプレート
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 新規作成時テンプレート利用
if has("autocmd")
  augroup templates
    au!
    if expand('%:p:h') =~ 'src\|lib\|app'
      autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/template/skelton_class.'.expand("<afile>:e")
    elseif expand('%:p:h') =~ 'test'
      autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/template/skelton_test.'.expand("<afile>:e")
    elseif expand('%:p:h') =~ 'spec'
      autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/template/skelton_spec.'.expand("<afile>:e")
    else
      autocmd BufNewFile *.* silent! execute '0r $HOME/.vim/template/skelton.'.expand("<afile>:e")
    endif
    autocmd BufNewFile * %substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
  augroup END
endif

function! Template(type)
  let pos = getpos('.')
  let template_path = $HOME . "/.vim/template/"
  let template = ""
  if a:type =~ 'class'
    let template_path .= "skelton_class.".expand("%:e")
  elseif a:type =~ 'test'
    let template_path .= "skelton_test.".expand("%:e")
  elseif a:type =~ 'spec'
    let template_path .= "skelton_spec.".expand("%:e")
  else
    let template_path .= "skelton.".expand("%:e")
  endif
  for line in readfile(template_path)
    let template .= line . "\n"
  endfor
  " echo template
  let template = template|substitute#\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]#\=eval(submatch(1))#ge
  execute ":normal i" . template
  call setpos('.', pos)
  " return substitute(template, '\[:VIM_EVAL:\]\(.\{-\}\)\[:END_EVAL:\]', '\=eval(submatch(1))', 'g')
endfunction
command! -nargs=? Template :call Template(<f-args>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ctags連携
if isdirectory(".git")
  " let g:auto_ctags = 1
  " let g:auto_ctags_directory_list = ['.git', '.svn']
  function! GenerateCtags()
    let langs = ['HTML', 'Java', 'JavaScript', 'PHP', 'Python', 'Ruby']
    for lang in langs
      call system('ctags -R --tag-relative=yes --sort=yes --append=no --languages='. lang .' --exclude="tmp" --exclude="cache" --exclude="test" -f .git/' . lang . '_tags 2> /dev/null')
    endfor
  endfunction
  " set tags+=.git/tags
  command! Ctags :call GenerateCtags()
  autocmd BufRead,BufNewFile *.php set tags=.git/PHP_tags
  autocmd BufRead,BufNewFile *.rb set tags=.git/Ruby_tags
  autocmd BufRead,BufNewFile *.java set tags=.git/Java_tags
  autocmd BufRead,BufNewFile *.js set tags=.git/JavaScript_tags
  autocmd BufRead,BufNewFile *.py set tags=.git/Python_tags
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" clipboard
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" pbcopy remoto連携(微妙だがmac以外)
if executable("pbcopy") && !has("mac")
  function! Yankc()
    let tmpfile = '.vimreg' . getpid()
    call writefile(split(getreg('*'),'\n'),tmpfile,"b")
    call system('cat ' . tmpfile . ' | pbcopy > /dev/tty')
    call system('rm ' . tmpfile)
  endfunction
  nnoremap yc :call Yankc()<CR>
endif

set re=1
set ttyfast
set lazyredraw
