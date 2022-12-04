autocmd filetype tex setl updatetime=1000
if isdirectory(g:vimenv.'/bundle/')
    let g:livepreview_engine = 'xelatex'
    let g:livepreview_previewer = 'open -a Skim'
    setlocal dictionary+=/usr/share/dict/words
endif

autocmd Filetype tex nnoremap <buffer> <silent> <nowait> <leader>lp :LLPStartPreview<CR>
