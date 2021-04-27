" Test Vim
let test#python#pytest#options = '-vv'
"let test#strategy = "dispatch"
nnoremap <Leader>rf :TestFile<CR>
nnoremap <Leader>rs :TestNearest<CR>
nnoremap <Leader>rl :TestLast<CR>
nnoremap <Leader>ra :TestSuite<CR>
