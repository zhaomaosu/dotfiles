set nocompatible
filetype off

" Vundle configuration
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" taglist插件配置
Plugin 'vim-scripts/taglist.vim'
" 让taglist窗口出现在Vim的左边
let Tlist_Use_Right_Window = 1
" 可使taglist只显示当前文件tag，其它文件的tag都被折叠起来
let Tlist_File_Fold_Auto_Close = 1
" 只显示一个文件中的tag，默认为显示多个
let Tlist_Show_One_File = 1
" Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_GainFocus_On_ToggleOpen = 1
" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
" 设置窗体宽度，可以根据自己喜好设置
let Tlist_WinWidth = 30
" 热键设置
map <F3> :TlistToggle<CR>

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=30

call vundle#end()

filetype plugin indent on

set autoread
set completeopt=preview,menu
set cursorline
set syntax=on
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
