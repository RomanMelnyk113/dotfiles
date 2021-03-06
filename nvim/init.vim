let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

"Ctags
"Plug 'ludovicchabant/vim-gutentags'
" Git
Plug 'tpope/vim-fugitive'
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
" Темы
Plug 'sonph/onehalf', {'rtp': 'vim/'}
" Поддержка Python
" Status bar plugins
Plug 'vim-airline/vim-airline'
" Automatic quotes
"Plug 'jiangmiao/auto-pairs'
" Testing
Plug 'janko-m/vim-test'
" Other
Plug 'preservim/tagbar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'machakann/vim-highlightedyank'
" help to highlight syntax
Plug 'sheerun/vim-polyglot'

Plug 'gotcha/vimpdb'
Plug 'tweekmonster/django-plus.vim'

" Javascript support
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'

" Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sebdah/vim-delve'
call plug#end()

" Autoinstall plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif



" Optional themes for airline/lightline
" from https://www.reddit.com/r/vim/comments/6z4aau/how_to_stop_vim_from_autohighlighting_italics_in/
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')



if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
" switch beetween tabs
nnoremap <C-Tab> :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>


source $HOME/.config/nvim/basic.vim
source $HOME/.config/nvim/coc.vim
source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/vimspector.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/test.vim
source $HOME/.config/nvim/git.vim
source $HOME/.config/nvim/golang.vim
