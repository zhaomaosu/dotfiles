set nocompatible
filetype indent off

call plug#begin('~/.config/nvim/plugged')

" -- oceanic-next
Plug 'mhartington/oceanic-next'

" -- rainbow
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

" -- indent detector
Plug 'luochen1990/indent-detector.vim'

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
hi default LspCxxHlGroupEnumConstant ctermfg=176
hi default LspCxxHlGroupNamespace ctermfg=136
hi default LspCxxHlGroupMemberVariable ctermfg=81
hi default LspCxxHlSymFunctionVariable guifg=#26cdca

" -- LanguageClient
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let s:ccls_settings = {
         \ 'cache': {'directory': '.ccls_cache'},
         \ 'highlight': { 'lsRanges' : v:true },
         \ 'clang': { 'resourceDir': '/usr/local/lib/clang/11.0.0' },
         \ }

let s:ccls_command = ['ccls', '--init=' . json_encode(s:ccls_settings), '--log-file=/tmp/cc.log']

let g:LanguageClient_serverCommands = {
    \ 'c': s:ccls_command,
    \ 'cpp': s:ccls_command,
    \ }

nn <silent> gd :call LanguageClient#textDocument_definition()<cr>
nn <silent> gr :call LanguageClient#textDocument_references({'includeDeclaration': v:false})<cr>
nn <silent> K :call LanguageClient#textDocument_hover()<cr>

" bases
nn <silent> gxb :call LanguageClient#findLocations({'method':'$ccls/inheritance'})<cr>
" bases of up to 3 levels
nn <silent> gxB :call LanguageClient#findLocations({'method':'$ccls/inheritance','levels':3})<cr>
" derived
nn <silent> gxd :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true})<cr>
" derived of up to 3 levels
nn <silent> gxD :call LanguageClient#findLocations({'method':'$ccls/inheritance','derived':v:true,'levels':3})<cr>

" caller
nn <silent> gxc :call LanguageClient#findLocations({'method':'$ccls/call'})<cr>
" callee
nn <silent> gxC :call LanguageClient#findLocations({'method':'$ccls/call','callee':v:true})<cr>

" $ccls/member
" nested classes / types in a namespace
nn <silent> gxs :call LanguageClient#findLocations({'method':'$ccls/member','kind':2})<cr>
" member functions / functions in a namespace
nn <silent> gxf :call LanguageClient#findLocations({'method':'$ccls/member','kind':3})<cr>
" member variables / variables in a namespace
nn <silent> gxm :call LanguageClient#findLocations({'method':'$ccls/member'})<cr>

set updatetime=300
set cmdheight=2

" -- deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

" -- echodoc
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" -- lightline.vim
Plug 'itchyny/lightline.vim'

function! LangugeServerStatus() abort
  let l:errors = 0
  let l:warnings = 0
  for item in getqflist()
      if item["type"] == "E"
          let l:errors += 1
      else
        if item["type"] == "W"
          let l:warnings += 1
        endif
      endif
  endfor
  if LanguageClient#isServerRunning() == 0
    return 'not working!'
  endif
  return l:errors + l:warnings == 0 ? "✔ " : "✖ :" . l:errors . " " . "⚠ :" . l:warnings
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'lspstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'lspstatus': 'LangugeServerStatus',
      \ },
      \ }

call plug#end()

filetype plugin indent on

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif 
endif

if has('python')
  map <C-K> :pyf $HOME/.config/nvim/clang-format.py<cr>
  imap <C-K> <c-o>:pyf $HOME/.config/nvim/clang-format.py<cr>
elseif has('python3')
  map <C-K> :py3f $HOME/.config/nvim/clang-format.py<cr>
  imap <C-K> <c-o>:py3f $HOME/.config/nvim/clang-format.py<cr>
endif

set termguicolors
set autoread
set completeopt-=preview
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
