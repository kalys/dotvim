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

set mouse=a

let g:use_default_shortcuts_for_zoom = 0 "zoom.vim plugin uses this

let mapleader=","
let maplocalleader=";"


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
no H 6<Down>
no T 6<Up>
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
nmap <leader>p :CtrlPMixed<CR>

nmap <leader>c :let @+ = expand("%")<CR>
nmap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nmap <leader>d :NERDTreeFind<CR>
nmap <C-Y> <C-T>

map <Leader>tt :VimwikiToggleListItem<CR>

" move currunt line to the top
nnoremap zT :execute "normal! " . (line(".") + &scrolloff) . "Gzt"<cr>

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
    autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 && &buftype != "nofile" && &buftype != "quickfix" | silent write | endif
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

" vimwiki
let g:vimwiki_key_mappings = {
            \ 'all_maps': 1,
            \ 'global': 1,
            \ 'headers': 1,
            \ 'text_objs': 1,
            \ 'table_format': 1,
            \ 'table_mappings': 0,
            \ 'lists': 1,
            \ 'links': 1,
            \ 'html': 1,
            \ 'mouse': 0,
            \ }

let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 2

let g:vimwiki_list = [{'path': '~/vimwiki/', 'rx_todo': '\C\<\%(TODO\|DONE\|STARTED\|FIXME\|FIXED\|XXX\|WONT\)\>'}]

" required!
Plug 'tpope/vim-rails'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easymotion/vim-easymotion'

" Navigation
Plug 'kalys/nerdtree-dvorak'
Plug 'ctrlpviM/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'lervag/file-line'

Plug 'godlygeek/tabular'
Plug 'moll/vim-bbye'

" Vimviki
Plug 'vimwiki/vimwiki'

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
Plug 'jxnblk/vim-mdx-js'

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
let g:ag_prg = 'ag --vimgrep'
nmap <leader>a :Ag ""<Left>
nmap <leader>A :Ag "\b<cword>\b"<CR>

execute pathogen#infect()

set exrc
set secure

packadd lsp

" lsp
" let lspOpts = #{autoHighlightDiags: v:true}
" autocmd VimEnter * call LspOptionsSet(lspOpts)

let lspServers = [#{
  \  name: 'ruby-lsp',
  \  filetype: ['ruby'],
  \  path: 'ruby-lsp',
  \  args: ['stdio']
  \  }]
call LspAddServer(lspServers)

" GoTo code navigation.
nmap <silent>gd :LspGotoDefinition<CR>
nmap <silent>gy :LspGotoTypeDef<CR>
nmap <silent>gi :LspGotoImpl<CR>
nmap <silent>gr :LspPeekReferences<CR>
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" end of lsp
