set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

if !has('nvim')
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif

Plugin 'townk/vim-autoclose'

Plugin 'scrooloose/nerdtree'

Plugin 'severin-lemaignan/vim-minimap'

Plugin 'shime/vim-livedown'

Plugin 'majutsushi/tagbar'

Plugin 'itchyny/lightline.vim'

Plugin 'mhinz/vim-startify'

Plugin 'iandoe/vim-osx-colorpicker'

Plugin 'skammer/vim-css-color'

Plugin 'storyn26383/vim-vue'

Plugin 'pangloss/vim-javascript'

Plugin 'leafgarland/typescript-vim'

Plugin 'hail2u/vim-css3-syntax'

"Plugin 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plugin 'cakebaker/scss-syntax.vim'

Plugin 'iloginow/vim-stylus'

Plugin 'flazz/vim-colorschemes'

Plugin 'laib3/vim-todo-plugin'

"Snipptest snipMate
  Plugin 'MarcWeber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  Plugin 'garbas/vim-snipmate'

 "Optional
  Plugin 'honza/vim-snippets'

"Add after thies line your own Plugin

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
" Put your non-Plugin stuff after this lineset number
set number
set mouse=a
set backspace=indent,eol,start
syntax on
set background=dark
colo molokai
set ignorecase
set incsearch
set nohlsearch
set noautoindent
set nosmartindent
set nocindent
set tabstop=4
let g:python_recommended_stylee=0
let g:netrw_banner = 1
let g:netrw_liststyle = 1
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set nocursorline

set guifont=Monaco:h13
set transparency=0
set foldmethod=manual
set nospell
set spelllang=de


" NERDTree setting =======================
" autocmd vimenter * NERDTree
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '[▸]' " ▸
let g:NERDTreeDirArrowCollapsible = '[▾]' " ▾
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nmap <F4> :NERDTreeMirror<CR>
let NERDTreeShowHidden=0
let NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1

" =========================================

" Markdown Preview ========================

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337

" the browser to use
let g:livedown_browser = "safari"

map <F6> :LivedownPreview<CR>

"=========================================

nmap <F5> :TagbarToggle<CR>

" Status line (lightline.vim)

set laststatus=2

map <F2> :Startify<CR>
map <F7> :set nospell<CR>
map <F8> :set spell<CR>


if has('nvim')
      autocmd TabNewEntered * Startify
    else
      autocmd BufWinEnter *
            \ if !exists('t:startify_new_tab')
            \     && empty(expand('%'))
            \     && empty(&l:buftype)
            \     && &l:modifiable |
            \   let t:startify_new_tab = 1 |
            \   Startify |
            \ endif
    endif

" color picker ==========================

" let g:colorpicker_app = 'iTerm.app'

map <C-x> :ColorHEX<CR>
map <C-c> :ColorRGB<CR>

"=======================================

" Color Highlightning =================

g:cssColorVimDoNotMessMyUpdatetime
let g:cssColorVimDoNotMessMyUpdatetime = 1
"=====================================

" Javascript bundle ===================

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Typescript ==========================

let g:typescript_indent_disable = 1
something
    .foo()
    .bar();

let g:typescript_opfirst='\%([<>=,?^%|*/&]\|\([-:+]\)\1\@!\|!=\|in\%(stanceof\)\=\>\)'
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd FileType typescript :set makeprg=tsc
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" CSS3 Syntax ============================

augroup VimCSS3Syntax
  autocmd!

  autocmd FileType css setlocal iskeyword+=-
augroup END

:highlight VendorPrefix guifg=#00ffff gui=bold
:match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

" File for SCSS ===============================

au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-

" Todo's shortcut

call plug#begin()
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
call plug#end()

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"snipMate:
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases['ruby'] = 'ruby,rails'

