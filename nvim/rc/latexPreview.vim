autocmd filetype tex setl updatetime=1000
let g:livepreview_engine = 'xelatex'
let g:livepreview_previewer = 'open -a Skim'
setlocal dictionary+=/usr/share/dict/words

autocmd Filetype tex nnoremap <buffer> <silent> <nowait> <leader>lp :LLPStartPreview<CR>
