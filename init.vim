set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim'
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'zchee/deoplete-jedi'
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set fileencoding=utf-8
set expandtab
set number
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
let mapleader = ","
let maplocalleader = "\\"
iabbrev adn and
iabbrev waht what
iabbrev @@ chensy1996@gmail.com
inoremap <leader><c-u> <esc>viwUwa
nnoremap <leader><c-u> viwUw
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>v
inoremap jk <esc>

" Match parenthese
inoremap ( ()<Esc>i
inoremap { {<CR><BS>}<Esc>ko

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
let g:ale_linters = { 'python': ['pylint'] }
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1
let g:ale_python_flake8_options = '--ignore=E252 --max-line-length=120'
augroup CloseLoclistWindowGroup
        autocmd!
        autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

"NerdTree
map <C-n> :NERDTreeToggle %<CR>
let g:NERDTreeHijackNetrw=0

"deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" fzf
