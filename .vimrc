scriptencoding utf-8
set encoding=utf-8

if has("gui_running")
  set guifont=Monaco:h14
  set guioptions-=m  "remove menu bar
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
endif

set nobackup
set noswapfile
set ignorecase
set number
set ruler

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set nowrap
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set list
set autoindent
set cursorline                  " underline the current line, for quick orientation

set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set history=1000                " remember more commands and search history
set undolevels=1000             " use many muchos levels of undo
set wrapscan
set virtualedit=all             " allow the cursor to go in to "invalid" places

set cpoptions+=$     " when changing a line, don't redisplay, but put a '$' at
set switchbuf=useopen           " reveal already opened files from the

let g:use_default_shortcuts_for_zoom = 0 "zoom.vim plugin uses this

let mapleader=","

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>m <C-w>s
nnoremap <leader>c <C-i>
nnoremap <leader>r <C-o>
nnoremap / /\v
vnoremap / /\v
nmap <leader>t :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>

nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeIgnore=[ '^\.git$' ]

set nocompatible               " be iMproved
filetype off                   " required!

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1b1b1b ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=NONE ctermbg=NONE

" fuzzy matching settings
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" ctrlp tweaks
let g:ctrlp_working_path_mode = 0 " don't manage working directory
let g:ctrlp_jump_to_buffer = 0 " disable jumping to already open buffer
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|vendor|\.bundle|node_modules|target)'

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'kalys/vim-rails.git'
Plugin 'tpope/vim-fugitive'
Plugin 'kalys/dvimorak'
Plugin 'jvortmann/zoom.vim'
Plugin 'nathanaelkane/vim-indent-guides'

" Navigation
Plugin 'kalys/nerdtree-dvorak'
" Plugin 'git://git.wincent.com/command-t.git'
Plugin 'kien/ctrlp.vim'

Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'

" Syntax
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-cucumber'
Plugin 'kchmck/vim-coffee-script'
Plugin 'briancollins/vim-jst'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-markdown'
Plugin 'rodjek/vim-puppet'
Plugin 'avakhov/vim-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'StanAngeloff/php.vim'
Plugin 'jnwhiteh/vim-golang'
Plugin 'derekwyatt/vim-scala'

" Colorschemes
Plugin 'wgibbs/vim-irblack'
Plugin 'matthewtodd/vim-twilight'
Plugin 'flazz/vim-colorschemes'

" Arduino
Plugin 'jplaut/vim-arduino-ino'
Plugin 'sudar/vim-arduino-syntax'
call vundle#end()

filetype plugin indent on     " required!

colorscheme twilight
set shell=/bin/zsh
