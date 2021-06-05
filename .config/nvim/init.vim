"" ----------- Setup nvim ----------- 
set nocompatible
set fileencoding=utf-8
set encoding=utf-8

"" ----------- Plugin Manager Setup -----------

" Install if no exist
if empty(glob('~/.config/nvim/autoload/plug.vim')) 
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load Plugins
call plug#begin('~/.config/nvim/plugged')

" syntax
Plug 'sheerun/vim-polyglot'

" utilities
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'

" ide
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'yggdroot/indentline'
Plug 'ap/vim-css-color'

" ui
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'ackyshake/spacegray.vim'
Plug 'chriskempson/base16-vim'
Plug 'mike-hearn/base16-vim-lightline'

call plug#end()

"" ----- Default Settings -----

" Core
set clipboard+=unnamedplus
set nobackup
set noswapfile
set nowritebackup
set splitbelow
set splitright
filetype plugin indent on
syntax on

" Text formating
set expandtab
set shiftwidth=2
set shiftround
set smartindent
set softtabstop=2
set textwidth=80
set wrap
set tabstop=2

" Interaction
set scrolloff=5
set sidescrolloff=5

" Visual decorations
set laststatus=2
set showmode
set showcmd
set modeline
set ruler
set title
set number
set cursorline
set signcolumn=yes
" set colorcolumn=+1

if (has("termguicolors"))
  set termguicolors
endif

colorscheme base16-ocean

" Search
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], [], ['relativepath', 'modified']],
      \   'right': [['kitestatus'], ['filetype', 'percent', 'lineinfo'], ['gitbranch']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'kitestatus': 'kite#statusline'
      \ },
      \ 'colorscheme': 'base16_ocean',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}

"" ----- Plugins Settings -----
" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.js,*.jsx,*.ts,*.tsx'

" javascript syntax
let g:javascript_enable_domhtmlcss=1

" IndentLine
let g:indentLine_char = '┊'
let g:indentLine_first_char = '┊'
let g:indentLine_showFirstIndentLevel = 1

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeDirArrows=1

" NerdCommenter
let g:NERDSpaceDelims = 1           " Add spaces after comment delimiters

"" ----- Shortcuts -----
let mapleader="\<Space>"

" Save, close, erase and execute
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>e :1,$d<cr>
nnoremap <leader>x :!node %<cr>

" Fast scrolling
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>
nnoremap J 5j
nnoremap K 5k

" Move lines up or down
nnoremap <A-j> :m .+1<cr>
nnoremap <A-k> :m .-2<cr>
vnoremap <A-j> :m '>+1'<cr>
vnoremap <A-k> :m '<-2'<cr>

" NERDTree maps
nnoremap <leader>t :NERDTreeToggle<cr>

" Emmet
let g:user_emmet_leader_key='<C-m>'
