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
  set vb t_vb=
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


" dvimorak start
inoremap hh <Esc>
no d h
no h j
no t k
nnoremap h gj
nnoremap t gk
no n l
no s :
no S :
no j d
no l n
no L N
no N <C-w><C-w>
no H 8<Down>
no T 8<Up>
no D <C-w><C-r>
no - $
no _ ^
" dvimorak end

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>h :sp<CR>
nnoremap <leader>m <C-w>s

nnoremap <leader>c <C-i>
nnoremap <leader>r <C-o>
nnoremap <leader>u :Bdelete<CR>

nnoremap / /\v
vnoremap / /\v
nmap <leader>t :CtrlP<CR>
nmap <leader>b :CtrlPBuffer<CR>

nmap <leader>c :let @+ = expand("%")<CR>
nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>d :NERDTreeFind<CR>
nmap <C-Y> <C-T>

map <Leader>tt :VimwikiToggleListItem<CR>

" window navigation
nmap <C-D> <C-W>h
nmap <C-H> <C-W>j
nmap <C-T> <C-W>k
nmap <C-N> <C-W>l
" nmap <C-H> <C-W>j<C-W>_
" nmap <C-T> <C-W>k<C-W>_
let NERDTreeQuitOnOpen=0
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore=[ '^\.git$' ]

set nocompatible               " be iMproved
filetype off                   " required!

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1b1b1b ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=NONE ctermbg=NONE

" fuzzy matching settings
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,/tmp/*

" ctrlp tweaks
let g:ctrlp_working_path_mode = 0 " don't manage working directory
let g:ctrlp_jump_to_buffer = 0 " disable jumping to already open buffer
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|vendor|\.bundle|node_modules|app\/frontend\/node_modules|target|deps|_build|tmp)'
let g:ctrlp_max_files=0

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" ruby
let ruby_operators = 1
let ruby_pseudo_operators = 1

" JavaScript
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END

" Linters
" prettier
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier

" ale
" let g:ale_linters = {
" \   'ruby': ['ruby'],
" \}


" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails'
Plugin 'jvortmann/zoom.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'thoughtbot/vim-rspec'
Plugin 'easymotion/vim-easymotion'

" Code completion
Plugin 'ycm-core/YouCompleteMe'

" Navigation
Plugin 'kalys/nerdtree-dvorak'
Plugin 'ctrlpviM/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'Chun-Yang/vim-action-ag'
Plugin 'lervag/file-line'

Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'moll/vim-bbye'

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rhubarb'

" Syntax
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-cucumber'
Plugin 'kchmck/vim-coffee-script'
Plugin 'briancollins/vim-jst'
Plugin 'tpope/vim-markdown'
Plugin 'rodjek/vim-puppet'
Plugin 'avakhov/vim-yaml'
Plugin 'vim-ruby/vim-ruby'
Plugin 'StanAngeloff/php.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'kylef/apiblueprint.vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'keith/rspec.vim'
Plugin 'keith/swift.vim'
Plugin 'tpope/vim-commentary'
Plugin 'isRuslan/vim-es6'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-endwise'
Plugin 'pedrohdz/vim-yaml-folds'

" Linters
Plugin 'prettier/vim-prettier'
Plugin 'ngmy/vim-rubocop'

" Colorschemes
Plugin 'wgibbs/vim-irblack'
Plugin 'matthewtodd/vim-twilight'
Plugin 'flazz/vim-colorschemes'

" Arduino
Plugin 'jplaut/vim-arduino-ino'
Plugin 'sudar/vim-arduino-syntax'

" rails ecosystem
" Plugin 'thoughtbot/vim-rspec'
Plugin 'rlue/vim-fold-rspec'

" JS
Plugin 'kristijanhusak/vim-js-file-import'

" experiment
Plugin 'tyru/open-browser.vim'
Plugin 'tyru/open-browser-github.vim'

call vundle#end()

filetype plugin indent on     " required!

colorscheme hybrid
set shell=/bin/zsh

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

execute pathogen#infect()

set exrc
set secure
