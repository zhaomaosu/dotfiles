set nocompatible
filetype indent off

call plug#begin('~/.config/nvim/plugged')

" -- oceanic-next
Plug 'mhartington/oceanic-next'

" -- rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" -- nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

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
hi default LspCxxHlGroupEnumConstant ctermfg=176
hi default LspCxxHlGroupNamespace ctermfg=136
hi default LspCxxHlGroupMemberVariable ctermfg=81

" -- LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_serverCommands = {
    \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
    \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/home/maosuzha/.config/nvim/settings.json'

nn <silent> gd :call LanguageClient#textDocument_definition()<cr>
nn <silent> gr :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>
nn <silent> K :call LanguageClient#textDocument_hover()<cr>

" -- deoplete & echodoc
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }
let g:deoplete#enable_at_startup = 1

Plug 'Shougo/echodoc.vim'
" Or, you could use neovim's floating text feature.
set noshowmode
let g:echodoc#enable_at_startup = 1

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
colorscheme OceanicNext 
