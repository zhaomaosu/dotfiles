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

" --coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nn <silent> K :call CocActionAsync('doHover')<cr>

set updatetime=300
au CursorHold * sil call CocActionAsync('highlight')
au CursorHoldI * sil call CocActionAsync('showSignatureHelp')

call plug#end()

filetype plugin indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
endif

" clang-format
map <C-k> :py3f $HOME/.config/nvim/clang-format.py<cr>
imap <C-k> <c-o>:py3f $HOME/.config/nvim/clang-format.py<cr>

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
