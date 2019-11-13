set fileencoding=utf-8
set expandtab
set number
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
let mapleader = ","
let maplocalleader = "\\"
iabbrev adn and
iabbrev waht what
iabbrev @@ chensy1996@gmail.com
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
