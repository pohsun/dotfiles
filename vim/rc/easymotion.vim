if v:version >= 703 && filereadable(g:vimenv.'/bundle/vim-easymotion/README.md')
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase= 1
    let g:EasyMotion_inc_highlight = 1
    let g:EasyMotion_re_line_anywhere = '\v(<.|^$)|(>|^$)|(\1)\zs(\u)|([_#]\zs.)'
    omap f <Plug>(easymotion-s)
    xmap f <Plug>(easymotion-s)
    nmap f <Plug>(easymotion-prefix)
    imap <C-F> <C-O><Plug>(easymotion-prefix)
    nmap <Plug>(easymotion-prefix)s <Plug>(easymotion-s2)
    nmap <Plug>(easymotion-prefix)w <Plug>(easymotion-w)
    nmap <Plug>(easymotion-prefix)b <Plug>(easymotion-b)
    nmap <Plug>(easymotion-prefix)/ <Plug>(easymotion-sn)
    nmap <Plug>(easymotion-prefix)j <Plug>(easymotion-bd-jk)
    nmap <Plug>(easymotion-prefix)a <Plug>(easymotion-lineanywhere)
    nmap <Plug>(easymotion-prefix)f <Plug>(easymotion-sl2)
endif
