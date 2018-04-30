""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

let s:dein_dir = '~/.vim/vundle/dein.vim'
set runtimepath+=~/.vim/vundle/dein.vim

if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 call dein#load_toml("~/.vim/settings/plugins.toml", { 'lazy': 0 })
 call dein#load_toml("~/.vim/settings/plugins_lazy.toml", { 'lazy': 1 })

 call dein#end()
 call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable
