if filereadable(g:vimenv.'/bundle/vim-hopping/README.md')
    let g:hopping#keymapping = {
    \   "\<Down>" : "<Over>(hopping-next)",
    \   "\<Up>"   : "<Over>(hopping-prev)",
    \   "\<C-y>" : "<Over>(scroll-y)",
    \   "\<C-u>" : "<Over>(scroll-u)",
    \   "\<C-f>" : "<Over>(scroll-f)",
    \   "\<C-e>" : "<Over>(scroll-e)",
    \   "\<C-d>" : "<Over>(scroll-d)",
    \   "\<C-b>" : "<Over>(scroll-b)",
    \}
    nnoremap <leader>? :HoppingStart --input=<C-R><C-W><CR>
    nnoremap <leader>/ :HoppingStart<CR>
endif
