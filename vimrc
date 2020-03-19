set nocompatible
filetype indent off

call plug#begin('~/.config/nvim/plugged')

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

" -- coc & ccls
Plug 'neoclide/coc.nvim', {'branch': 'release'}
set updatetime=300
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
autocmd CursorHold * silent call CocActionAsync('highlight')

nn <silent> gxb :call CocLocations('ccls','$ccls/inheritance')<cr>
nn <silent> gxB :call CocLocations('ccls','$ccls/inheritance',{'levels':3})<cr>
nn <silent> gxd :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true})<cr>
nn <silent> gxD :call CocLocations('ccls','$ccls/inheritance',{'derived':v:true,'levels':3})<cr>
nn <silent> gxc :call CocLocations('ccls','$ccls/call')<cr>
nn <silent> gxC :call CocLocations('ccls','$ccls/call',{'callee':v:true})<cr>
nn <silent> gxm :call CocLocations('ccls','$ccls/member')<cr>
nn <silent> gxf :call CocLocations('ccls','$ccls/member',{'kind':3})<cr>
nn <silent> gxs :call CocLocations('ccls','$ccls/member',{'kind':2})<cr>
nn <silent> gxv :call CocLocations('ccls','$ccls/vars')<cr>
nn <silent> gxV :call CocLocations('ccls','$ccls/vars',{'kind':1})<cr>

nn <silent><buffer> <C-l> :call CocLocations('ccls','$ccls/navigate',{'direction':'D'})<cr>
nn <silent><buffer> <C-k> :call CocLocations('ccls','$ccls/navigate',{'direction':'L'})<cr>
nn <silent><buffer> <C-j> :call CocLocations('ccls','$ccls/navigate',{'direction':'R'})<cr>
nn <silent><buffer> <C-h> :call CocLocations('ccls','$ccls/navigate',{'direction':'U'})<cr>

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
colorscheme oct22 
