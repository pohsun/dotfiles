if v:version >= 703 && isdirectory(g:vimenv.'/bundle/vim-easymotion')
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase= 1
    let g:EasyMotion_inc_highlight = 1
    let g:EasyMotion_re_line_anywhere = '\v(<.|^$)|(>|^$)|(\1)\zs(\u)|([_#]\zs.)'

    " Remark: Never use noremap or it won't work.
    imap <C-J> <C-O><Plug>(easymotion-s2)
    xmap <C-J> <Plug>(easymotion-sn)
    omap <C-J> <Plug>(easymotion-sn)
endif
