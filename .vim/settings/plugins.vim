""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

let s:dein_dir = '~/.vim/vundle/dein.vim'
set runtimepath+=~/.vim/vundle/dein.vim

if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 call dein#add(s:dein_dir)
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable
