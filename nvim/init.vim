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
Plug 'patstockwell/vim-monokai-tasty'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
"Plug 'joshdick/onedark.vim'
" Поддержка Python
" Status bar plugins
Plug 'vim-airline/vim-airline'
" Automatic quotes
"Plug 'jiangmiao/auto-pairs'
" Testing
Plug 'janko-m/vim-test'
" Other
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
"Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'machakann/vim-highlightedyank'
"Plug 'tmhedberg/SimpylFold'
"Plug 'Konfekt/FastFold'
" help to highlight syntax
Plug 'sheerun/vim-polyglot'
" db plugin
Plug 'tpope/vim-dadbod'

Plug 'puremourning/vimspector'             " debugger
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

" let vim know that we want to use pylint
"let g:neomake_python_enabled_makers = ['pylint']
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
let g:vimspector_enable_mappings = 'HUMAN'

" В нормальном режиме Ctrl+n вызывает :NERDTree
nmap <leader>n :NERDTreeFocus<CR>
nmap <C-n> :NERDTree<CR>
nmap <C-t> :NERDTreeToggle<CR>
"nmap <C-f> :FZF<CR>
nmap <C-f> :GFiles<CR>
nnoremap <leader>f :Rg<CR>
" replace default vim grep functionlality
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" add new line
nmap <silent> <space> :exe "normal i".nr2char(getchar())<CR>
nmap <silent> <s-space> :exe "normal a".nr2char(getchar())<CR>

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']

" Тема для **NeoVim**
"syntax on
"let g:vim_monokai_tasty_italic = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

"=====================================================
"" General settings
"=====================================================
if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif
set encoding=utf-8
set t_Co=256                                " 256 colors
set guifont=mononoki\ Nerd\ Font\ 18
"let g:vim_monokai_tasty_italic = 1
colorscheme onehalfdark
" Optional themes for airline/lightline
let g:airline_theme='onehalfdark'                   " airline theme
" from https://www.reddit.com/r/vim/comments/6z4aau/how_to_stop_vim_from_autohighlighting_italics_in/
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')
" If you don't like a particular colour choice from `vim-monokai-tasty`, you can
" override it here. For example, to change the colour of the search hightlight:
"hi ppythonBuilti guifg=#bada55 guibg=#000000 gui=bold ctermfg=green ctermbg=black cterm=bold
"let g:airline_theme='wombat'                " set airline theme
"let g:onedark_termcolors=256
"let g:onedark_terminal_italics=1
syntax enable                               " enable syntax highlighting

set pyxversion=0
let g:loaded_python_provider = 1
set shell=/bin/zsh
set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration
set lazyredraw
set autoread                                " autoread file

"set foldmethod=indent
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
set relativenumber                          " display relative numbersj
" Simply fold configuration
"let g:SimpylFold_docstring_preview = 1

" coc.nvim specific
let g:coc_global_extensions = [
  \'coc-json',
  \'coc-html',
  \'coc-css',
  \'coc-yaml',
  \'coc-pyright',
  \'coc-emoji',
  \'coc-snippets',
  \'coc-sql',
  \'coc-lists',
  \'coc-tag',
  \'coc-omni',
  \'coc-syntax',
  \'coc-docker',
  \'coc-sh',
  \'coc-git',
  \'coc-docker',
  \'coc-sh',
  \'coc-actions',
  \'coc-eslint',
  \'coc-prettier',
\]

" if hidden is not set, TextEdit might fail.
set hidden
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Navigation
nnoremap <silent> <space><Leader> :<C-u>CocList files<CR>
nnoremap <silent> <space>m        :<C-u>CocList grep<CR>
nnoremap <silent> <space>d        :<C-u>CocList gstatus<CR>
nnoremap <silent> <space>.        :<C-u>CocList buffers<CR>
nnoremap <silent> <space>/        :<C-u>CocList lines<CR>

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

vmap <leader>l <Plug>(coc-format-selected)
nmap <leader>l <Plug>(coc-format-selected)

nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev)

" Remap keys for git commands
"nmap <silent> ]c <Plug>(coc-git-nextchunk)
"nmap <silent> [c <Plug>(coc-git-prevchunk)
nmap <silent> <Leader>hp <Plug>(coc-git-chunkinfo)
nmap <silent> <Leader>hb <Plug>(coc-git-commit)
nmap <silent> <Leader>hr :<C-u>CocCommand git.chunkUndo<CR>
nmap <silent> <Leader>hs :<C-u>CocCommand git.chunkStage<CR>

nmap <F2> <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>da <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>do <Plug>(coc-fix-current)

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" fold all by indent in current file
"nnoremap <Leader>fa :set foldmethod=indent<CR>

"syn match dFunction "\zs\(\k\w*\)*\ze("
"syn match dFunction1 "\zs\(\k\w*\)*\ze("
"hi link dFunction Function

" Test Vim
"let test#strategy = "dispatch"
nnoremap <Leader>rf :TestFile<CR>
nnoremap <Leader>rs :TestNearest<CR>
nnoremap <Leader>rl :TestLast<CR>
nnoremap <Leader>ra :TestSuite<CR>

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif
" switch beetween tabs
nnoremap <C-Tab> :tabn<CR>
nnoremap <C-S-Tab> :tabp<CR>
