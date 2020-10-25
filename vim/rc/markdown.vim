let g:markdown_fenced_languages = ['cpp', 'python', 'json']

let g:pandoc#filetypes#handled=["markdown", "rst", "textile"]
let g:pandoc#filetypes#pandoc_markdown=1
let g:pandoc#hypertext#use_default_mappings=0
let g:pandoc#modules#disabled=[]
let g:pandoc#syntax#conceal#blacklist = ['atx', 'list']
let g:pandoc#syntax#conceal#cchar_overrides={}
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#folding#mode="relative"
let g:pandoc#syntax#codeblocks#embeds#langs = ["bash=sh", "python"]

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'firefox'
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
autocmd Filetype markdown nnoremap <buffer> <silent> <nowait> <F9> :MarkdownPreview<CR>

setlocal dictionary+=/usr/share/dict/words
