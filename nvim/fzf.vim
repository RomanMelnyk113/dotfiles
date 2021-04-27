
"nmap <C-f> :FZF<CR>
nmap <C-f> :GFiles<CR>
nnoremap <leader>f :Rg<CR>
" replace default vim grep functionlality
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
" https://github.com/junegunn/fzf.vim/issues/346#issuecomment-288483704
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
