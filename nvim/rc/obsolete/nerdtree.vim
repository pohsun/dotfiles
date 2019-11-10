let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " let ctrlP perform search under selected path
nnoremap <silent> <F5> : NERDTreeTabsToggle<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let tagbar_width=50
let g:tagbar_compact=1
