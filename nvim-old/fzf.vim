
"nmap <C-f> :FZF<CR>
nmap <C-f> :GFiles<CR>
nnoremap <leader>f :Rg<CR>
" replace default vim grep functionlality
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o -name '.*_test.go' -prune -o -name '.*mock.*.go' -prune -o -name '.*pb.go' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"" The Silver Searcher
"if executable('ag')
  "let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  "set grepprg=ag\ --nogroup\ --nocolor
"endif

"" ripgrep
"if executable('rg')
  "let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  "set grepprg=rg\ --vimgrep
  "command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"endif
