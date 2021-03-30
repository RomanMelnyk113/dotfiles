call plug#begin()

"Ctags
"Plug 'ludovicchabant/vim-gutentags'
" Git
Plug 'tpope/vim-fugitive'
" Lint
Plug 'dense-analysis/ale'
" FuzzyFinder (для быстрого поиска)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" NERDTree - быстрый просмотр файлов
Plug 'preservim/nerdtree'
" Сoc - автодополнение 
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Дополнения для NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdcommenter'
" Дополнение для Git, а также иконки для NERDTree
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
" Линия статуса
Plug 'itchyny/lightline.vim'
" Темы
"Plug 'crusoexia/vim-monokai'
Plug 'patstockwell/vim-monokai-tasty'
"Plug 'joshdick/onedark.vim'
" Проверка Синтаксиса
"Plug 'scrooloose/syntastic' 
" Плагин автозавершения
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
" Поддержка Python
Plug 'davidhalter/jedi-vim'
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
" Status bar plugins
Plug 'vim-airline/vim-airline'
" Automatic quotes
Plug 'jiangmiao/auto-pairs'
" Code cheker
"Plug 'neomake/neomake'

" Other
Plug 'machakann/vim-highlightedyank'
"Plug 'tmhedberg/SimpylFold'
call plug#end()

" Autoinstall plugins 
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
" Делаем Vim более функциональным
"set nocompatible
"set t_Co=256

" Делаем линейку для отображения на какой мы строке и сколько расстояния до
" других строк в **NeoVim**
"set number
"set ruler

" Комбинация клавиш jk - действует как Escape в режиме Insert
inoremap jk <ESC>

" Делаем так, чтобы навигация работала на русском языке
nmap о j
nmap л k
nmap р h
nmap д l
nmap ш i
nmap ф a
nmap в d

" Deoplete
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" let vim know that we want to use pylint
"let g:neomake_python_enabled_makers = ['pylint']

" В нормальном режиме Ctrl+n вызывает :NERDTree
nmap <leader>n :NERDTreeFocus<CR>
nmap <C-n> :NERDTree<CR>
nmap <C-t> :NERDTreeToggle<CR>
"nmap <C-f> :FZF<CR>
nmap <C-f> :GFiles<CR>
nmap <leader>f :Ag<CR>
nmap <leader>ff :Rg<CR>

" add new line
nmap <silent> <space> :exe "normal i".nr2char(getchar())<CR>
nmap <silent> <s-space> :exe "normal a".nr2char(getchar())<CR>

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']

" Тема для **NeoVim**
syntax on
let g:vim_monokai_tasty_italic = 1


"=====================================================
"" General settings
"=====================================================
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
set encoding=utf-8
set t_Co=256                                " 256 colors
set guifont=mononoki\ Nerd\ Font\ 18
colorscheme vim-monokai-tasty 
let g:airline_theme='wombat'                " set airline theme
syntax enable                               " enable syntax highlighting

set pyxversion=0
let g:loaded_python_provider = 1
set shell=/bin/bash
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8	                            " utf-8 by default

set nobackup 	                            " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile 	                            " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=20                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...

"=====================================================
"" Ale Settings (Linting)
"=====================================================
" Use Ale.
" Show Ale in Airline
let g:airline#extensions#ale#enabled = 1

" Ale Gutter
let g:ale_sign_column_always = 1
