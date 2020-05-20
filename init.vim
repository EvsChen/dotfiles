set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'flazz/vim-colorschemes'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown'}
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'lervag/vimtex'
call plug#end()

colorscheme blackboard

set fileencoding=utf-8
set expandtab
set number
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
let mapleader = ","
let maplocalleader = "\\"
noremap <leader>ta :Windows<cr>
noremap <leader>tw :tabclo<cr>
inoremap <leader><c-u> <esc>viwUwa
nnoremap <leader><c-u> viwUw
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>v
inoremap <C-e> <C-o>A
inoremap <C-a> <C-o>I
inoremap jk <esc>

" Match parenthese and quotation mark
" inoremap ( ()<Esc>i
" inoremap         (  ()<C-G>U<Left>
" inoremap <expr>  )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<C-G>U\<Right>" : ")"
" inoremap [ []<Esc>i
" inoremap " ""<Esc>i
" inoremap ' ''<Esc>i

" In next parenthese
onoremap in( :<c-u>normal! f(vi(<cr>
" Around next parenthese
onoremap an( :<c-u>normal! f(va(<cr>
" In last parenthese
onoremap il( :<c-u>normal! F)vi(<cr>
" Around last parenthese
onoremap al( :<c-u>normal! F)va(<cr>

" Same for the curly bracket
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap al{ :<c-u>normal! F}va{<cr>

" Fold
nnoremap <space> za
vnoremap <space> zf


" Force training by mapping
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Esc> <nop>
" autocmd
augroup filetype_cpp
	autocmd!
	autocmd FileType cpp let g:ale_cpp_clangd_options = '-compile-commands-dir=build'
        autocmd FileType cpp let g:ale_completion_enabled = 0
augroup END

augroup filetype_js
        autocmd!
        autocmd FileType javascript nnoremap <localleader>c <buffer> I//<esc>
        autocmd FileType javascript setlocal tabstop=2
        autocmd FileType javascript setlocal shiftwidth=2
        autocmd BufNewFile,BufRead *.js setlocal number
augroup END

augroup filetype_python
        autocmd!
        autocmd FileType python     nnoremap <localleader>c <buffer> I#<esc>
        autocmd FileType python     setlocal foldmethod=indent
augroup END

augroup filetype_html
        autocmd!
        autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
        autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

augroup filetype_tex
        autocmd!
        autocmd FileType tex inoremap { {}<Esc>i
        autocmd FileType tex inoremap $ $$<Esc>i
augroup END

" fzf
nnoremap <C-p> :GFiles<CR>
if system('uname') == 'Darwin'
        " in mac system, install fzf using homebrew
        set rtp+=/usr/local/opt/fzf
elseif system('uname') == 'Linux'
        set rtp+=~/.fzf
endif

let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" ale
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"
let g:ale_linters = { 'python': ['pylint', 'pyls'], 'cpp': ['clang']}
let g:ale_open_list = 1
let g:ale_completion_enabled = 1
let g:ale_keep_list_window_open = 1
let g:ale_completion_max_suggestions = 10
let g:ale_python_flake8_options = '--ignore=E252 --max-line-length=120'
let g:ale_c_parse_compile_commands = 1
let g:ale_python_pyls_config = {
                                \'pyls': {
                                        \'plugins': {
                                                        \'pyflakes': { 'enabled': v:false },
                                                        \'flake8': { 'enabled': v:false },
                                                        \ 'pycodestyle': { 'enabled': v:false },
                                                        \ 'pylint': { 'enabled': v:false }
                                                \}
                                        \}
                                \}

augroup CloseLoclistWindowGroup
        autocmd!
        autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

"NerdTree
map <C-n> :NERDTreeToggle %<CR>
let g:NERDTreeHijackNetrw=0

"NerdCommenter
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCompactSexyComs = 1

" ycm
let g:ycm_global_ycm_extra_conf='~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

" vimtex
let g:tex_flavor  = 'latex'
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
set conceallevel=1
let g:tex_conceal='abdgm'
