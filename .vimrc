set shell=/bin/bash
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
"Plugin 'ap/vim-css-color'
Plugin 'dag/vim-fish'

Bundle 'jordwalke/flatlandia'
Bundle 'DavidEGx/ctrlp-smarttabs'

" required for vundle
call vundle#end()
filetype plugin indent on

" colors
set background=dark
" colorscheme base16-railscasts
colorscheme Tomorrow-Night-Eighties

let mapleader = ","
syntax on

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" nerdtree
let NERDTreeShowHidden=1
nmap <leader>ne :NERDTree<CR>
nmap \e :NERDTreeToggle<CR>
map <silent> <C-n> :NERDTreeFocus<CR>

" ctrlp
let g:ctrlp_show_hidden = 1
nmap ; :CtrlPBuffer<CR>
nmap \p :CtrlP<CR>
" ctrlp-smarttabs 
nmap \; :CtrlPSmartTabs<CR>

set encoding=utf-8
set t_Co=256
set smartindent
set breakindent
set tabstop=2
set shiftwidth=2
set expandtab
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set number
set laststatus=2 " always show airline
set backspace=indent,eol,start

" recognize .eye as ruby
au BufNewFile,BufRead *.eye set filetype=ruby

" toggle highlights on columns >80
" toggle with <leader>H
nnoremap <Leader>H :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
  echo "Long lines highlighted"
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
  echo "Long lines unhighlighted"
 endif
endfunction

" Send more characters for redraws
set ttyfast

" Enable mouse use in all modes
set mouse=a

" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
set ttymouse=xterm2


" Ctrl-Left or Ctrl-Right to go to the previous or next tabs, and can press
" Alt-Left or Alt-Right to move the current tab to the left or right.
nnoremap <leader> l :bnext<CR>
nnoremap <leader> h :bprevious<CR>

" j/k move up/down one row and not one line
nmap j gj
nmap k gk

" use emacs style movement in vim's command line (like bash)
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" search highlighting
set incsearch           " highlight searches as theyre typed
set ignorecase          " case insensitive searching when only lower case is used
set smartcase
set hlsearch            " highlight the current search

" clear search highlighting
nmap \q :nohlsearch<CR>

"""""""""""""""""""""""""""""""
