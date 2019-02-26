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
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-syntastic/syntastic'
Plugin 'junegunn/fzf.vim'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim'
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
Plugin 'zchee/deoplete-jedi'
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
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/
let mapleader = ","
let maplocalleader = "\\"
iabbrev adn and
iabbrev waht what
iabbrev @@ chensy1996@gmail.com
inoremap <leader><c-u> <esc>viwUwa
nnoremap <leader><c-u> viwUw
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>v
inoremap jk <esc>

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
augroup END

augroup filetype_html
        autocmd!
        autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
        autocmd BufNewFile,BufRead *.html setlocal nowrap
augroup END

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_post_args="--max-line-length=120"
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

"NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeHijackNetrw=0

"deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"ctrlp
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

