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
  \'coc-go',
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
