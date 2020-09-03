
"""""""""""""""""""""""""""""""""""
" Sections:
" 	=> General 
" 	=> Keybindings
" 	=> Vundle plugin manager
"""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""

" Enable syntax higlighting
syntax on

" Display line numbers
set nu

" Use relative numbers
set relativenumber

" Map computers registers to vim registers
" set clipboard=unnamed
" set clipboard=unnamedplus

" Copy the indention from previous line, when starting a new line
set autoindent

" Disable swap files
set noswapfile

" Enable fzf fuzzy search
set rtp+=/usr/local/opt/fzf

"""""""""""""""""""""""""""""""""""
" => Keybindings
"""""""""""""""""""""""""""""""""""
" Move between windows
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move between bufferrs
nnoremap <C-Left> :bprevious!<CR>
nnoremap <C-Right> :bnext!<CR>
" FZF fuzzy search 
nnoremap <C-p> :FZF<CR>

"""""""""""""""""""""""""""""""""""
" => Vundle plugin manager 
"""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" nerdtree filemananger plugin
Plugin 'preservim/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required
