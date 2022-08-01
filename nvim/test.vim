" Test Vim
let test#python#pytest#options = '-vv'
let test#go#runner = 'gotest'
let test#go#gotest#options = '-v'
let test#go#gotest#executable = 'gotest'
"let test#strategy = "dispatch"
nnoremap <Leader>rf :TestFile<CR>
nnoremap <Leader>rs :TestNearest<CR>
nnoremap <Leader>rl :TestLast<CR>
"nnoremap <Leader>ra :TestSuite<CR>

" Golang specific
nnoremap <Leader>db :DlvToggleBreakpoint<CR>
nnoremap <Leader>da :DlvClearAll<CR>
nnoremap <Leader>ds :DlvTestCurrent<CR>
