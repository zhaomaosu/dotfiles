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

" -- vim-lsp    
Plug 'prabirshrestha/vim-lsp'    
if executable('ccls')    
   au User lsp_setup call lsp#register_server({    
      \ 'name': 'ccls',    
      \ 'cmd': {server_info->['ccls']},    
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},    
      \ 'initialization_options': {    
      \   'cache': {'directory': '/tmp/ccls/cache' },    
      \   'highlight': { 'lsRanges' : v:true },    
      \ },    
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],    
      \ })    
endif    
    
" Key bindings for vim-lsp.    
nn <silent> gd :LspDefinition<cr>    
nn <silent> gr :LspReferences<cr>    
nn <silent> rn :LspRename<cr>

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
