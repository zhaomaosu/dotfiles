set nocompatible

call plug#begin('~/.config/nvim/plugged')

" -- nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" -- auto-pairs
Plug 'jiangmiao/auto-pairs'
let b:AutoPairs = {"(":")","{":"}","[":"]"}
let g:AutoPairsFlyMode = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsSmartMode = 1
let g:AutoPairsMapCh = 0

" -- vim-lsp-cxx-highlight
Plug 'jackguo380/vim-lsp-cxx-highlight'
let g:lsp_cxx_hl_use_text_props = 1

" -- deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" -- LanguageClient & ccls
Plug 'autozimu/LanguageClient-neovim', { 
            \ 'branch': 'next', 
            \ 'do': 'bash install.sh', 
            \ }
let s:ccls_settings = {
            \ 'highlight':{ 'lsRanges' : v:true },
            \ }
let s:ccls_command = ['ccls', '-init=' . json_encode(s:ccls_settings), '--log-file=/tmp/ccls.ms.log']
let g:LanguageClient_serverCommands = {
    \ 'c': s:ccls_command,
    \ 'cpp': s:ccls_command,
    \ 'objc': s:ccls_command,
    \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_settingsPath = expand('~/.config/nvim/ccls_settings.json')
set completefunc=LanguageClient#complete

call plug#end()

filetype plugin indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
endif

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
set mouse=a
set number
set modelineexpr
" -- set themes --
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme OceanicNext
