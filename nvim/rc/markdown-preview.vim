let g:markdown_fenced_languages = ['cpp', 'python', 'json']

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
" let g:mkdp_browser = 'firefox' " firefox
let g:mkdp_echo_preview_url = 1

" uml: This keyword setting (```plantuml, ```) is compatible with mkdocs and MWeb
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {
    \    'openMarker': '```plantuml',
    \    'closeMarker': '```'},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle'
    \ }

autocmd Filetype markdown nnoremap <buffer> <silent> <nowait> <leader>lp :MarkdownPreview<CR>
