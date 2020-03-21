" James Rolfe vim settings file

set nocompatible              " be iMproved, required
filetype off                  " required

""" START PLUGINS
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" list plugins
Plugin 'preservim/nerdtree'
Plugin 'scrooloose/syntastic'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To install, launch vim and run :PluginInstall or vim +PluginInstall +qall
" from cli

""" CONFIGURE PLUGINS
" NERDTree: directory navigation and sidebar
" start NERDTree whenever vim is started
" autocmd vimenter * NERDTree
" close vim if NERDTree is the only thing left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open/close NERDTree with ctrl+n
nnoremap <C-n> :NERDTreeToggle<CR>

" SPACES & TABS
set tabstop=2               " number of visual spaces per tab
set softtabstop=2           " number of spaces in tab when editing
set shiftwidth=2            " when indenting with '>', use 4 spaces width
set expandtab               " tabs are spaces
" set textwidth=80            " wrap lines at 80 characters
set formatoptions=tcqlron   " auto-wrap lines/comments at textwidth,
                            " allow formatting using gq commands,
                            " long lines not broken in insert more
                            " auto-insert comment leader on Enter or O,
                            " recognize numbered lists
set wrapmargin=2            " auto-wrap as typing a line > textwidth

" COLORS
colorscheme badwolf         " num 1
" colorscheme goodwolf      " num 4
" colorscheme solarized     " num 2
" colorscheme molokai       " num 3
syntax enable               " enable syntax processing

" UI CONFIG
set number               " show line numbers
set showcmd              " show command in bottom bar
set cursorline           " highlight current line
filetype indent on       " load filetype-specific indent files
set wildmenu             " visual autocomplete for command menu
set lazyredraw           " redraw only when we need to
set showmatch            " highlight matching [{()}]
set ruler                " always show cursor position

" SEARCHING
set incsearch            " search as characters are entered
set hlsearch             " highlight matches
" turn off search highlight
nnoremap <leader><space> :noh<CR>

" MOVEMENT
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" $/^ does not do anything
" nnoremap $ <nop>
" nnoremap ^ <nop>
" highligh last inserted text
nnoremap gV `[v`]

" WINDOW SPLITTING
set splitright

" MISC
filetype plugin on          " enable plug-ins
let g:tex_flavor='latex'    " set empty .tex file default to latex
set clipboard=unnamed


