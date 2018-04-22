""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" キーマッピング
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" ハイライトをEscでクリア
nnoremap <ESC><ESC> :nohlsearch<CR>

" vimgrep
nnoremap // :vimgrep
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

" 括弧自動挿入, 位置調整
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [ []<Left>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap ( ()<Left>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap """<Enter> """<Left><CR><ESC><S-o>
inoremap " ""<Left>
" inoremap """<Space> """<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
inoremap <<Space> <><Left>
inoremap /<Space> //<Left>

" ;と:を入れ替える
nnoremap ; :
nnoremap ; :

" 入力しづらいキーをマッピング
nnoremap <Space>h ^
nnoremap <Space>l $
nnoremap <Space>/ *

" splitキーバインド
nnoremap s <Nop>
"" 画面移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>p
"" 画面サイズ変更
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s= <C-w>=
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
"" 画面入れ替え
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sr <C-w>r

" ctags keybind
nnoremap <c-[> :pop<CR>

" ESC keybind
imap <C-f> <ESC><Right>
vmap <C-j> <ESC><Right>

" tab keybind
nnoremap <C-N> :tabn<CR>
nnoremap <C-P> :tabp<CR>

" 大文字小文字の誤爆を防ぐ
vnoremap u <Nop>
vnoremap U <Nop>
noremap gu <Nop>
noremap gU <Nop>
