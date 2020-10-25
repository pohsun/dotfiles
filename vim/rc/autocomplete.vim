if g:loaded_completer=='deo'
    let g:deoplete#enable_at_startup=1
    call deoplete#custom#option({
\ 'num_processes': 2,
\ 'auto_complete_delay': 20,
\ 'max_list': 100,
\   })

    imap <C-j>     <Plug>(neosnippet_expand_or_jump)
    smap <C-j>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-j>     <Plug>(neosnippet_expand_target)

    smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    let g:neosnippet#enable_snipmate_compatibility = 1
    let g:neosnippet#snippets_directory = g:vimenv.'bundle/vim-snippets'

    " c-family complete
    " python complete
    let g:deoplete#sources#jedi#extra_path = ["/opt/local/lib/python3.6/site-packages"]

elseif g:loaded_completer=='ycm'
    " NOTE: Add correct include path, which can be retrieved by 'echo | clang -v -E -x c++ -', to conf.
    let g:ycm_min_num_of_chars_for_completion = 2
    let g:ycm_show_diagnostics_ui = 0 " Turn off ycm syntastic check, take over by ale
    let g:ycm_always_populate_location_list = 1
    let g:ycm_key_invoke_completion = ''
    let g:ycm_global_ycm_extra_conf = g:lxHome.'ycm_extra_conf.py'
    let g:ycm_complete_in_comments = 1
    let g:ycm_collect_identifiers_from_comments_and_strings = 1
    let g:ycm_collect_identifiers_from_tags_files=1
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_key_list_select_completion = ['<Down>', '<TAB>']
    let g:ycm_key_list_previous_completion = ['<Up>', '<S-TAB>']
    let g:ycm_add_preview_to_completeopt = 1
    let g:ycm_autoclose_preview_window_after_completion = 0
    let g:ycm_autoclose_preview_window_after_insertion = 0
    let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'markdown' : 1,
        \ 'notes' : 1,
        \ 'unite' : 1,
        \ 'text' : 1,
        \ 'vimwiki' : 1,
        \ 'infolog' : 1,
        \ 'mail' : 1
        \}
    let g:ycm_goto_buffer_command = 'horizontal-split'
    if !exists('g:ycm_semantic_triggers')
        let g:ycm_semantic_triggers = {}
    endif
    let g:ycm_semantic_triggers.tex = ['re!\\[A-Za-z]*(ref|cite)[A-Za-z]*([^]]*])?{([^}]*, ?)*']
    nnoremap <silent> <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

    " ultisnips
    let g:UltiSnipsExpandTrigger="<C-J>"
    let g:UltiSnipsListSnippets="<C-J><C-J>"
    let g:UltiSnipsJumpForwardTrigger="<C-J>"
    let g:UltiSnipsJumpBackwardTrigger="<C-K>"
else
    imap <C-J> <Plug>snipMateNextOrTrigger
    smap <C-J> <Plug>snipMateNextOrTrigger
    set complete-=i
    let g:SuperTabRetainCompletionType=2
    let g:acp_behaviorSnipmateLength=1
endif

