set nocompatible              " be iMproved, required
filetype off                  " required


" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Features
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Languages
Plug 'moll/vim-node'  

" Small utilies
Plug 'szw/vim-g'     
call plug#end()

" set the runtime path to include Vundle and initialize
" https://github.com/VundleVim/Vundle.vim 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Scala code
Plugin 'derekwyatt/vim-scala'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'tpope/vim-fugitive'

Plugin 'git://git.wincent.com/command-t.git'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Vimgit plugin, handle git from vim
Plugin 'jreybert/vimagit'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Tmux navigartion 
" https://github.com/christoomey/vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'
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
" Put your non-Plugin stuff after this line

syntax on
filetype plugin indent on



execute pathogen#infect()
  
filetype plugin on


inoremap {{      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O

inoremap ((      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O

inoremap [[      []<Left>
inoremap [<CR>  [<CR>]<Esc>O

map <tab> %
imap <c-e> <esc>$i<right>
imap <c-a> <esc>0i


nnoremap <C-Left> :bprevious!<CR>
nnoremap <C-Right> :bnext!<CR>
nnoremap <Leader>q :Bclose!<CR>

nnoremap <C-s> :shell<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-a> <C-w>

let g:airline#extensions#tabline#enabled = 1
let g:airline_section_a = airline#section#create(['mode',' ','branch'])

"Syntastic plugin settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*




set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows


hi CursorLine ctermbg=235 cterm=none
au InsertEnter * set cursorline
au InsertLeave * set nocursorline

" fzf fuzzy finder
set rtp+=~/.fzf
nnoremap <C-p> :FZF<CR>
nnoremap <C-a> :Ag<CR>
nnoremap <C-o> :Buffers<CR>


" Wimiwiki settings
let wiki_1 = {}
let wiki_1.path = '~/Documents/Wiki/'

let wiki_2 = {}
let wiki_2.path = '~/Documents/Twebcast/Wiki/'

let wiki_3 = {}
let wiki_3.path = '~/Documents/School/Wiki/'

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]

autocmd BufnewFile,BufRead *.tsx set syntax=javascript

""""""""""""""""""""""""""""
" Sections:
"   -> General
"   -> Colors and fonts
"   -> Find and search
"   -> GUI
"   -> Plugins
""""""""""""""""""""""""""""
""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""
" Map leader, with a leader it's possible to extra key combinations
" like <leader>w saves current file
let mapleader = "\<space>"
" Disable swap files
set noswapfile
" Tabcharacters appers 4 spaces wide
set tabstop=4
" Set to control how many columns vim uses when you hit Tab in insertmode
set softtabstop=4
" Set to control how many columns text is indented with reindent operations
" (<< and >>)
set shiftwidth=4
" Set textwidth to 80, longer line will be broker after white space to get
" this width
set textwidth=80
" Use shiftwidth at the beginning of the line whereas tabstop and sfottabstop
" is use elsewhere
set smarttab
" WHen <TAB> press insert softtabstop amout of space characters
set expandtab
" Dont use smartindenet
set nosmartindent
" Copy the indention from previous line, when starting a new line
set autoindent
" Display long lines as just one line( no line wrapping)
set nowrap
" Diplay line numbers
set nu
" Use relative numbers 
set relativenumber
" Turn of compatible 
set nocompatible
" Map computers registers to vim registers
set clipboard=unnamed
set clipboard=unnamedplus
""""""""""""""""""""""""""""
" => Colors and fonts
""""""""""""""""""""""""""""
" Use terminals background instead of colorschemas default
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif
" Set color schema
colorscheme jellybeans 

""""""""""""""""""""""""""""
" => Find and search
""""""""""""""""""""""""""""
"Instant search
set incsearch
"Case insensitive search
set ic 
set smartcase
" Highligh search result, how do I remove the highlight when iam done? 
" set hlsearch

""""""""""""""""""""""""""""
" => GUI
""""""""""""""""""""""""""""
"remove menu bar
set guioptions-=m  
"remove toolbar
set guioptions-=T  
 "remove right-hand scroll bar
set guioptions-=r
"remove left-hand scroll bar
set guioptions-=L  

""""""""""""""""""""""""""""
" => GUI
""""""""""""""""""""""""""""

""""""""""""""""""""""""""""
"   -> Ctrl-p
"""""""""""""""""""""""""""
