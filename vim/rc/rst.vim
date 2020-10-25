let g:riv_fold_blank = 0
let g:instant_rst_slow = 0
let g:instant_rst_browser = 'chromium'
let g:instant_rst_forever = 1
let g:instant_rst_localhost_only = 1
"let g:instant_rst_port = 17500 " 17500, 17600, 17603?
autocmd BufReadPost,BufNewFile *.rst inoremap $$ :math:`` <++><ESC>F`i
"autocmd BufReadPost,BufNewFile *.rst InstantRst
