set nocompatible                " choose no compatibility with legacy vi

filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nono/vim-handlebars'
Plugin 'Rename'
Plugin 'VimClojure'
Plugin 'rosstimson/scala-vim-support'
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdtree'
Plugin 'rking/ag.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'slim-template/vim-slim'
Plugin 'tpope/vim-surround'
Plugin 'janko-m/vim-test'
Plugin 'vim-scripts/tComment'
Plugin 'tpope/vim-eunuch'

" ruby plugins
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'

" theme
Plugin 'tomasr/molokai'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end() "required
filetype plugin indent on "required


" theme setup
set t_Co=256
colorscheme molokai
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'


" general config

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

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

map <leader>f :CtrlP<cr>       " map CtrlP
map <leader>F :CtrlP %%<cr>    " map CtrlP

map <C-n> :NERDTreeToggle<CR>  " open nerd-tree with control-n

" map Silver searcher
map <leader>a :Ag!<space>

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

" 80 character long ruler
  if exists('+colorcolumn')
    set colorcolumn=80
  endif


" highlight trailing spaces in annoying red
  highlight ExtraWhitespace ctermbg=1 guibg=red
  match ExtraWhitespace /\s\+$/
  autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
  autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
  autocmd InsertLeave * match ExtraWhitespace /\s\+$/
  autocmd BufWinLeave * call clearmatches()

