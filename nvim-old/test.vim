" Test Vim
let test#python#pytest#options = '-vv'
let test#go#runner = 'gotest'
let test#go#gotest#options = '-v -race'
"let test#go#gotest#options = '-v -race -cover -memprofile mem.prof -cpuprofile cpu.prof'
let test#go#gotest#executable = 'gotest'
"let test#strategy = "neovim"
let test#neovim#term_position = "vert"
"let g:test#neovim#start_normal = 1 " If using neovim strategy
nnoremap <Leader>rf :TestFile<CR>
nnoremap <Leader>rss :TestNearest --strategy=neovim<CR>
nnoremap <Leader>rs :TestNearest<CR>
nnoremap <Leader>rl :TestLast<CR>
"nnoremap <Leader>ra :TestSuite<CR>

" Golang specific
nnoremap <Leader>db :DlvToggleBreakpoint<CR>
nnoremap <Leader>da :DlvClearAll<CR>
nnoremap <Leader>ds :DlvTestCurrent<CR>
