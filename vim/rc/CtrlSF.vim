if filereadable(g:vimenv.'/bundle/ctrlsf.vim/README.md')
    let g:ctrlsf_ackprg = 'rg'
    let g:ctrlsf_regex_pattern = 1
    let g:ctrlsf_winsize = '30%'
    let g:ctrlsf_case_sensitive = 'smart'
    let g:ctrlsf_search_mode = 'async'
    let g:ctrlsf_context = '-C 2'
    function! MyCtrlSFLocal() "{{{
        let cmd = ":CtrlSF " . expand('<cword>') . " " . expand('%')
        exec cmd
    endfunction "}}}
    nnoremap ?? :call MyCtrlSFLocal()<CR>
    nnoremap // :CtrlSF<SPACE>
endif
