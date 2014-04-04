set nocompatible                " choose no compatibility with legacy vi

" vundle

filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'nono/vim-handlebars'
Bundle 'Rename'
Bundle 'VimClojure'
Bundle 'rosstimson/scala-vim-support'
Bundle 'pangloss/vim-javascript'
Bundle 'briancollins/vim-jst'

" solarized theme
Bundle 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized

" general config

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

set number
set directory^=$HOME/.backup//  " move swp and ~ files do somewhere else
set hidden                      " hides buffers instead of closing them
nnoremap ; :

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" use comma as <Leader> key instead of backslash
let mapleader=","

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

map <leader>f :CtrlP<cr>
map <leader>F :CtrlP %%<cr>

"C-h,j,l,k navigate between split screens
map <silent> <C-l> :wincmd l<cr> 
map <silent> <C-h> :wincmd h<cr> 
map <silent> <C-j> :wincmd j<cr> 
map <silent> <C-k> :wincmd k<cr> 
" Here's the vimclojure stuff. You'll need to adjust the NailgunClient
" setting if you're on windows or have other problems.
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
let vimclojure#WantNailgun = 0
let vimclojure#NailgunClient = $HOME . "/.vim/bundle/VimClojure/lib/vimclojure-nailgun-client/ng"
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

