" Make extra parentheses while pasting, set paste can avoid this issue.
" Known issue: not so good in visual->insert mode...
function! MyPlaceholderHighlight() abort "{{{
  highlight abridgePlaceholder ctermfg=9 ctermbg=228
endfunction "}}}
function! MyPlaceholderMatchadd() abort "{{{
  silent! call matchdelete(w:placeholder)
  let w:placeholder = matchadd('abridgePlaceholder','\%>'.(line('w0')).'l'.'\%<'.(line('w$')).'l'.'<++>', -1)
endfunction "}}}
let s:easyPlaceHolder=1
if s:easyPlaceHolder==1
    inoremap () ()<++><ESC>F)i
    inoremap [] []<++><ESC>F]i
    inoremap {} {}<++><ESC>F}i
    inoremap '' ''<++><ESC>F'i
    inoremap "" ""<++><ESC>F"i
    inoremap $$ $$<++><ESC>F$i
    inoremap <> <><++><ESC>2F<a
    inoremap <C-L> <ESC>/<++><CR>cf><ESC>:nohls<CR>a
    autocmd VimEnter,ColorScheme * call MyPlaceholderHighlight()
    autocmd CursorMoved,CursorMovedI * call MyPlaceholderMatchadd()
endif
