" --General ---
" Space is king
let mapleader = " "

set backspace=indent,eol,start
set nocompatible              
set ruler
set number
set nowrap
set showcmd
set incsearch
set hlsearch
filetype off                  " required
set noswapfile
set autoread
set ignorecase
set smartcase
set noerrorbells
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set backupcopy=yes


colorscheme zenburn
autocmd ColorScheme * highlight LineNr ctermbg=NONE
autocmd ColorScheme * highlight clear SignColumn

set rtp+=~/.fzf

" Get Plug if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'alvan/vim-closetag'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'tomasiser/vim-code-dark'
Plug 'ryanoasis/vim-devicons'
"Plug 'hugolgst/vimsence'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app & yarn install' }

call plug#end()

filetype plugin indent on    " required

source ~/.fzf/plugin/fzf.vim

" -- Dev icons for nerdtree
set encoding=UTF-8
" -- Open nerdtree on leader t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

let g:nerdtree_tabs_open_on_console_startup = 0

"-- Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='zenburn'
let g:airline#extensions#tabline#enabled = 1

syntax on

"--- LIT highlighting and autclosing
let g:htl_css_templates = 1 
let g:htl_all_templates = 1
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'
let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion,litHtmlRegion',
      \ 'javascript.jsx': 'jsxRegion,litHtmlRegion',
      \ 'javascript':     'litHtmlRegion',
      \ 'typescript':     'litHtmlRegion',
      \ }

"--- Vim Markdown settings
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1

"--- Sources
source /home/matsu/.vim/rcfiles/javascript.vim
source /home/matsu/.vim/rcfiles/java.vim
source /home/matsu/.vim/rcfiles/coc.vim
"--- You complete me
" Trying to map things like in IntelliJ
" Couln't get this shit to work
"nnoremap <silent> <C-b> :YcmCompleter GoTo<CR>
"nnoremap <silent> <C-g> :YcmCompleter GoToReferences<CR>
"nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" ---- Remaps

nnoremap <leader>r :!%:p<Enter>
nnoremap <C-n> :FZF<Enter>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <C-l> <C-i>
nnoremap <C-F> :Ag<CR>
