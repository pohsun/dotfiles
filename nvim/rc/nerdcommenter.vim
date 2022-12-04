let b:comment_leader = ''
let b:comment_tailer = ''
autocmd FileType vim        let b:comment_leader = '"'
autocmd Filetype vimwiki    let b:comment_leader = '%%'
autocmd FileType make       let b:comment_leader = '#'
autocmd FileType sh         let b:comment_leader = '#'
autocmd FileType python     let b:comment_leader = '#'
autocmd FileType c,cpp      let b:comment_leader = '//'
autocmd FileType java       let b:comment_leader = '//'
autocmd FileType tex        let b:comment_leader = '%'
autocmd Filetype html,xml   let b:comment_leader = '<!--'
autocmd Filetype html,xml   let b:comment_tailer = '-->'
autocmd Filetype markdown   let b:comment_leader = '<!--'
autocmd Filetype markdown   let b:comment_tailer = '-->'
autocmd FileType conf,fstab let b:comment_leader = '#'
if !isdirectory(g:vimenv.'/bundle/nerdcommenter')
    noremap <silent> <leader>cc :<C-B>silent <C-E>s/^\(.*\)$/<C-R>=escape(b:comment_leader,'\/')<CR>\1<C-R>=escape(b:comment_tailer,'\/')<CR>/<CR>:nohls<CR>
    noremap <silent> <leader>c<SPACE> :<C-B>silent <C-E>s/^\( *\)\([^ ].*\)$/\1<C-R>=escape(b:comment_leader,'\/')<CR>\2<C-R>=escape(b:comment_tailer,'\/')<CR>/<CR>:nohls<CR>
    noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\( *\)<C-R>=escape(b:comment_leader,'\/')<CR>\(.*\)<C-R>=escape(b:comment_tailer,'\/')<CR>$/\1\2/<CR>:nohls<CR>
    xnoremap <silent> <leader>cq :<C-E><C-U>silent '>s/$/\r<C-R>=escape(b:comment_tailer,'\/')<CR>/ <bar> '<s/^/<C-R>=escape(b:comment_leader,'\/')<CR>\r/<CR>:nohls<CR>
    xnoremap <silent> <leader>cQ :<C-E><C-U>silent '>s/<C-R>=escape(b:comment_tailer,'\/')<CR>\n// <bar> '<s/<C-R>=escape(b:comment_leader,'\/')<CR>\n//<CR>:nohls<CR>
endif
let g:NERDCustomDelimiters = {
    \ 'c'   : { 'leftAlt': '/*','rightAlt': '*/', 'left': '//', 'right': '' },
    \ 'cpp' : { 'leftAlt': '/*','rightAlt': '*/', 'left': '//', 'right': '' },
    \ 'rst' : { 'leftAlt': ''  ,'rightAlt': ''  , 'left':'.. ', 'right': '' },
\ }
