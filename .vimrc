
"""""""""""""""""""""""""""""""""""
" Sections:
" 	=> General 
" 	=> Keybindings
" 	=> Colortheme
" 	=> Vundle plugin manager
" 	=> ALE linting pluging
" 	=> Filetype settings
"""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""

" Enable syntax higlighting
syntax on
"Enable utf-8 encoding
set encoding=utf-8
" Display line numbers
set nu
" Use relative numbers
set relativenumber
" Copy the indention from previous line, when starting a new line
set autoindent
" Disable swap files
set noswapfile
" Enable fzf fuzzy search
set rtp+=/usr/local/opt/fzf
" Tabcharacters appers 4 spaces wide
set tabstop=4
" Number of whitespaces to be added in insertmode
set softtabstop=4
" Number of whitespaces to be added in normal mode
set shiftwidth=4
" Use spaces instead of tabs
set expandtab
" Set textwidth to 80, longer line will be broker after white space to get
" this width
set textwidth=80
" Use shiftwidth at the beginning of the line whereas tabstop and sfottabstop
" is use elsewhere
set smarttab
" Dont use smartindenet
set nosmartindent
" Copy the indention from previous line, when starting a new line
set autoindent
" Set mapleader to ,
let mapleader=","
"Instant search
set incsearch
"Case insensitive search
set ic 
" Highligt cursor line
set cursorline
"""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""
" Move between windows
" use C-L to move to the right
nnoremap <C-L> <C-W><C-L>
" use C-H to move to the left
nnoremap <C-H> <C-W><C-H>
" use C-J to move up
nnoremap <C-J> <C-W><C-J>
" use C-K to move down
nnoremap <C-K> <C-W><C-K>
" Move between bufferrs
nnoremap <C-Left> :bprevious!<CR>
nnoremap <C-Right> :bnext!<CR>
" FZF fuzzy search 
nnoremap <C-p> :FZF<CR>
nnoremap <C-o> :Buffers <CR>
nnoremap <C-a> :Rg <CR>

" Map <tab> to % for quicker select parantes
map <tab> %

" Map ImportJSGoto to quick navigate to Module
nnoremap gt :ImportJSGoto <CR>

" Map ImportJSFix to quick fix imports
nnoremap df :ImportJSFix <CR>

" Map ImportJSWork to import module under cursor
nnoremap di :ImportJSWord <CR>

" Map ALEFix to lint file
nnoremap lf :ALEFix <CR>

" Map ALEFindReferences
nnoremap fr :ALEFindReferences <CR>

"""""""""""""""""""""""""""""""""""
" => Colortheme
"""""""""""""""""""""""""""""""""""
colorscheme simple-dark
highlight Normal ctermbg=None
highlight LineNr ctermfg=None

"""""""""""""""""""""""""""""""""""
" => Vundle plugin manager 
"""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required filetype off                  " required

" Run :PluginInstall to install plugings
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" nerdtree filemananger plugin
Plugin 'preservim/nerdtree'

" Vim airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" GitGutter
Plugin 'airblade/vim-gitgutter'

" FZF for vim
Plugin 'junegunn/fzf.vim'

" Tmux navigartion 
" https://github.com/christoomey/vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'

" Ale lint plugin
Plugin 'w0rp/ale'

" Import-js, autoimport dependecies
Plugin 'galooshi/vim-import-js'


call vundle#end()            " required
filetype plugin indent on    " required

" Vim-airline settings
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""
" => ALE linting pluging
"""""""""""""""""""""""""""""""""""
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ }
 
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let g:ale_set_highlights = 0

let g:ale_fix_on_save = 0
let g:ale_completion_autoimport = 1

"""""""""""""""""""""""""""""""""""
" => Filetype settings
"""""""""""""""""""""""""""""""""""
" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
