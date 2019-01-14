set nocompatible
filetype off


" -------- Auto Install Plug
let plug_readme=expand('~/.vim/autoload/plug.vim')
if !filereadable(plug_readme)
  echo "Installing Plug.."
  echo ""
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif


" -------- Vundle Plugin
call plug#begin('~/.vim/plugged')

" ---- General
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar' " requirement: '$ sudo apt-get install exuberant-ctags'

" ---- Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


" ---- Python
Plug 'hdima/python-syntax'
Plug 'hynek/vim-python-pep8-indent'

" ---- HTML & CSS & Web
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'
Plug 'tpope/vim-haml'
Plug 'hzue/vim-vue'

" ---- Javascript
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'mxw/vim-jsx'
Plug 'gavocanov/vim-js-indent'

" ---- Syntax Color
Plug 'flazz/vim-colorschemes'

" ---- Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---- JSON
Plug 'elzr/vim-json'

" ---- Docker
Plug 'ekalinin/Dockerfile.vim'

" ---- Golang
Plug 'fatih/vim-go'

call plug#end()
filetype plugin indent on

" -------- General Setting
syntax on
set nu
set numberwidth=1
set cursorline
set wildmenu
set ruler
set hlsearch " highlight search result
set confirm
set history=50
set t_Co=256
set nowrap
set autoindent
set cindent " indent for C/C++
set incsearch
set encoding=utf-8
set fileencodings=utf-8,cp950,big5
set backupdir=~/tmp,,/var/tmp/vi,/tmp,.
set directory=~/tmp,/var/tmp/vi,/tmp,.
set backup

set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab

autocmd FileType html,css,javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal filetype=javascript.jsx
autocmd FileType javascript.jsx setlocal autoindent
autocmd FileType pug,sass setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType perl,python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType go setlocal shiftwidth=4 softtabstop=4
autocmd FileType c,sh setlocal shiftwidth=4 tabstop=4
autocmd FileType vue setlocal autoindent expandtab shiftwidth=2 softtabstop=2 commentstring=//\ %s comments=://

nnoremap <F5>  :NERDTreeToggle<CR>
noremap  <F6>  :TagbarToggle<CR>
noremap  `     :TComment<cr>
vnoremap `     :TComment<cr>gv

nnoremap <silent> <Tab> :wincmd w<CR>
nnoremap <silent> <C-H> :wincmd h<CR>
nnoremap <silent> <C-J> :wincmd j<CR>
nnoremap <silent> <C-K> :wincmd k<CR>
nnoremap <silent> <C-L> :wincmd l<CR>
nnoremap <silent> +     :wincmd +<CR>
nnoremap <silent> -     :wincmd -<CR>
nnoremap <silent> <     :wincmd <<CR>
nnoremap <silent> >     :wincmd ><CR>

nnoremap <silent> <C-p> :Fzf <CR>

" noremap <C-L> <Esc>:tabnext<CR>
" noremap <C-H> <Esc>:tabprevious<CR>


" -------- Plugin Setting

" ---- NERDTree
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=30
let g:NERDTreeMapOpenInTab = '<2-LeftMouse>'
" au VimEnter *  NERDTree

" ---- rainbow
let g:rainbow_active = 1

" ---- code color & theme
let g:airline_theme='simple'
colorscheme Tomorrow-Night-Eighties

" ---- gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_diff_base='HEAD'

" ---- vim-vue
let g:vue_default_script_lang = 'javascript'
let g:vue_default_template_lang = 'html'
let g:vue_default_style_lang = 'scss'
let g:vue_tag_color = 'Blue'
let g:vue_disable_pre_processors=1

" ---- json
let g:vim_json_syntax_conceal = 0

" ---- python-syntax
let python_highlight_all = 1

" ---- golang
let g:go_fmt_command = "goimports"

" ---- fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_buffers_jump = 1
autocmd VimEnter * command! Fzf
  \ call fzf#vim#files(<q-args>, {'left': '50%', 'options': '--reverse --prompt=""'})


" -------- Custom Script

" ---- nvim
if has('nvim')
set viminfo+=n~/.nvim/tmpfiles/viminfo
endif

" ---- simple tab auto complete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

" ---- return to previous cursor position
if has("autocmd")
  autocmd BufRead *.txt set tw=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" ---- 80 coding line
highlight ColorColumn ctermbg=235
let &colorcolumn=join(range(81,300),",")

" ---- template file
autocmd BufNewFile *.vue silent! 0r $HOME/.vim/template/tmpl.vue
