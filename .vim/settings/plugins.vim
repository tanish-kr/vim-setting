""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

let s:dein_dir = '~/.vim/vundle/dein.vim'
set runtimepath+=~/.vim/vundle/dein.vim

if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir)

 if has('win32') || has('win64')
   call dein#add('tbodt/deoplete-tabnine', { 'build': 'powershell.exe .\install.ps1' })
 else
   call dein#add('tbodt/deoplete-tabnine', { 'build': './install.sh' })
 endif

 call dein#load_toml("~/.vim/settings/plugins.toml", { 'lazy': 0 })
 call dein#load_toml("~/.vim/settings/plugins_lazy.toml", { 'lazy': 1 })

 call dein#end()
 call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

" if executable('solargraph')
"   " gem install solargraph
"   au User lsp_setup call lsp#register_server({
"       \ 'name': 'solargraph',
"       \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
"       \ 'initialization_options': {"diagnostics": "true"},
"       \ 'whitelist': ['ruby'],
"       \ })
" endif
"
" if executable('typescript-language-server')
"   au User lsp_setup call lsp#register_server({
"       \ 'name': 'typescript-language-server',
"       \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"       \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"       \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
"       \ })
" endif

filetype plugin indent on
syntax enable
