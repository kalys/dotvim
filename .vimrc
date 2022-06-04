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
nnoremap <leader>m <C-w>s

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

" autosave
augroup autosave
    autocmd!
    " autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && &buftype != "nofile" | silent write | endif
augroup END

call plug#begin()

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

" coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_global_extensions = ['coc-solargraph']

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" required!
Plug 'tpope/vim-rails'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'

" Code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Navigation
Plug 'kalys/nerdtree-dvorak'
Plug 'ctrlpviM/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'lervag/file-line'

Plug 'godlygeek/tabular'
Plug 'moll/vim-bbye'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" Syntax
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-cucumber'
Plug 'kchmck/vim-coffee-script'
Plug 'briancollins/vim-jst'
Plug 'tpope/vim-markdown'
Plug 'rodjek/vim-puppet'
Plug 'avakhov/vim-yaml'
Plug 'vim-ruby/vim-ruby'
Plug 'StanAngeloff/php.vim'
Plug 'derekwyatt/vim-scala'
Plug 'kylef/apiblueprint.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'keith/rspec.vim'
Plug 'keith/swift.vim'
Plug 'tpope/vim-commentary'
Plug 'isRuslan/vim-es6'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'mattn/emmet-vim'
Plug 'pedrohdz/vim-yaml-folds'

" Linters
Plug 'ngmy/vim-rubocop'

" Colorschemes
Plug 'wgibbs/vim-irblack'
Plug 'matthewtodd/vim-twilight'
Plug 'flazz/vim-colorschemes'

" Arduino
Plug 'jplaut/vim-arduino-ino'
Plug 'sudar/vim-arduino-syntax'

" rails ecosystem
Plug 'thoughtbot/vim-rspec'
Plug 'rlue/vim-fold-rspec'

" JS
Plug 'kristijanhusak/vim-js-file-import'

" Initialize plugin system
call plug#end()

filetype plugin indent on     " required!

colorscheme hybrid
set shell=/bin/zsh

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ack tricks
let g:ackprg = 'ag --vimgrep'
nmap <leader>a :Ag ""<Left>
nmap <leader>A :Ag "\b<cword>\b"<CR>

execute pathogen#infect()

set exrc
set secure
