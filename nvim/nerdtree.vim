" В нормальном режиме Ctrl+n вызывает :NERDTree
nmap <leader>n :NERDTreeFocus<CR>
nmap <C-n> :NERDTree<CR>
nmap <C-t> :NERDTreeToggle<CR>

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']
