if filereadable(g:vimenv.'/bundle/coc.vim/README.md')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd CursorHoldI * silent! call CocActionAsync('showSignatureHelp')

" https://github.com/neoclide/coc-snippets
    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<C-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<C-k>'

endif
