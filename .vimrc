set nocompatible
filetype off

"--------------------- Auto Install Vundle ---------------------
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim/
  let iCanHazVundle=0
endif

"--------------------- Vundle Plugin ---------------------
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tomtom/tcomment_vim'
Plugin 'luochen1990/rainbow'
Plugin 'Yggdroot/indentLine'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'majutsushi/tagbar'    " requirement: '$ sudo apt-get install exuberant-ctags'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'rizzatti/dash.vim'    " [inactive] macOS only (this plugin provides easy searching on document)
" ------- Python
Plugin 'hdima/python-syntax'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'davidhalter/jedi-vim' " [inactive] require: '$ pip install jedi'
" ------- C & C++
Plugin 'vim-jp/cpp-vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
" ------- Java
Plugin 'tfnico/vim-gradle'
" ------- HTML & CSS & Web
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'digitaltoad/vim-pug'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-haml'
Plugin 'hzue/vim-vue'
" ------- Javascript
Plugin 'othree/yajs.vim'
Plugin 'othree/es.next.syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'gavocanov/vim-js-indent'
Plugin 'gkz/vim-ls'
" ------- Markdown
Plugin 'plasticboy/vim-markdown'
" ------- Perl
Plugin 'vim-perl/vim-perl'
" ------- Git Utility
Plugin 'tpope/vim-fugitive'
" ------- Search Utility
Plugin 'kien/ctrlp.vim'
" ------- Syntax Color
Plugin 'flazz/vim-colorschemes'
" ------- Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" ------- JSON
Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on

"--------------------- General Setting ---------------------
syntax on
set nu
set numberwidth=1
set cursorline
set wildmenu
set ruler
set hlsearch
set confirm
set history=50
set t_Co=256
set nowrap
set autoindent
set cindent
set incsearch
set encoding=utf-8
set fileencodings=utf-8,cp950,big5
set backupdir=~/tmp,.,/var/tmp/vi,/tmp
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
autocmd FileType c,sh setlocal shiftwidth=4 tabstop=4

"" Light version for Vue syntax
" autocmd BufNewFile,BufEnter *.vue setfiletype vue
" autocmd FileType vue setlocal autoindent expandtab shiftwidth=2 softtabstop=2 commentstring=//\ %s comments=://
" \ | syntax include @PUG syntax/pug.vim | unlet b:current_syntax
" \ | syntax include @JS syntax/javascript.vim | unlet b:current_syntax
" \ | syntax include @SASS syntax/sass.vim | unlet b:current_syntax
" \ | syntax region vueTemplate matchgroup=vueTag start=/^<template.*>$/ end='</template>' contains=@PUG keepend
" \ | syntax region vueScript matchgroup=vueTag start=/^<script.*>$/ end='</script>' contains=@JS keepend
" \ | syntax region vueStyle matchgroup=vueTag start=/^<style.*>$/ end='</style>' contains=@SASS keepend
" \ | syntax match htmlArg /v-text\|v-html\|v-if\|v-show\|v-else\|v-for\|v-on\|v-bind\|v-model\|v-pre\|v-cloak\|v-once/ contained
" \ | syntax keyword htmlArg contained key ref slot
" \ | syntax keyword htmlTagName contained component transition transition-group keep-alive slot
" \ | syntax sync fromstart
" \ | highlight vueTag ctermfg=Blue

nnoremap <F5>  :NERDTreeToggle<CR>
noremap  <F6>  :TagbarToggle<CR>
nnoremap <F8>  :SyntasticToggleMode<CR>
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

"--------------------- Plugin Setting ---------------------

" --- vim-markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1
let g:vim_markdown_no_default_key_mappings=1

" --- rainbow
let g:rainbow_active = 1

" --- clang format
let g:clang_format#style_options = {
  \ "AccessModifierOffset" : -4,
  \ "AllowShortIfStatementsOnASingleLine" : "false",
  \ "AllowShortLoopsOnASingleLine" : "false",
  \ "AlwaysBreakTemplateDeclarations" : "true",
  \ "Standard" : "C++11",
  \ "BreakBeforeBraces" : "Stroustrup"
\ }

" --- code color & theme
" colorscheme Tomorrow-Night-Eighties
" colorscheme itg_flat
colorscheme monokai
" highlight Comment ctermfg = lightblue
let g:airline_theme='simple'

" --- gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_diff_base='HEAD'

" --- vim-vue
let g:vue_default_script_lang = 'javascript'
let g:vue_default_template_lang = 'pug'
let g:vue_default_style_lang = 'sass'
let g:vue_tag_color = 'Blue'

" --- json
let g:vim_json_syntax_conceal = 0

" --- python-syntax
let python_highlight_all = 1

"--------------------- Custom Script ---------------------

" --- simple tab auto complete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
set dictionary="/usr/dict/words"

" --- return to previous cursor position
if has("autocmd")
  autocmd BufRead *.txt set tw=78
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" --- toggle mouse
function! Toggle_Mouse()
  if &mouse == 'a'
    set mouse=
  else
    set mouse=a
  endif
endfunc
noremap <silent> <F10> :call Toggle_Mouse() <Enter>

" --- toggle 80 coding line
highlight ColorColumn ctermbg=235
function! Toggle_Code_Guide_Line()
  if &colorcolumn == 0
    let &colorcolumn=join(range(81,10000),",")
  else
    let &colorcolumn=0
  endif
endfunc
noremap <silent> <F11> :call Toggle_Code_Guide_Line() <Enter>

