if filereadable(g:vimenv.'/colors/jellybeans.vim/colors/jellybeans.vim')
    let g:jellybeans_background_color_256="none"
    colo jellybeans
    hi Search cterm=bold,standout
    hi Comment ctermfg=245
    hi LineNr ctermfg=245
    hi Error cterm=bold ctermbg=9 ctermfg=228
    exec "hi Folded ctermbg=".g:jellybeans_background_color_256
    exec "hi CursorLine cterm=underline ctermbg=".g:jellybeans_background_color_256
    hi CursorColumn ctermbg=52
    hi PmenuSel cterm=bold ctermfg=9 ctermbg=228
    hi MatchParen cterm=bold ctermfg=none ctermbg=228
    hi SpecialKey ctermfg=9
    if v:version >= 703
        "let &colorcolumn="80,".join(range(160,999,80),",")  " highlight i-th column
        let &colorcolumn="80"
        exec "hi ColorColumn cterm=standout ctermfg=56 ctermbg=".g:jellybeans_background_color_256
        exec "hi DiffChange ctermbg=1"
    endif
else
    colo default
endif
hi Cursor cterm=standout,bold
    " Other highligh stuff
function! MyCursorwordHighlight() abort "{{{
  highlight CursorWord0 cterm=underline,bold
  highlight CursorWord1 cterm=standout
endfunction "}}}
function! MyCursorwordMatchadd() abort "{{{
  let line = getline('.')
  let word0 = matchstr(line[:(col('.')-1)], '\k*$')[:-2] . matchstr(line[(col('.')-1):], '^\k*')
  let word1 = word0
  if mode() == 'i' && line[col('.')-2] != ' ' " Inserting mode
      let word1 = matchstr(line[:(col('.')-2)], '\k*$')[:-2] . matchstr(line[(col('.')-2):], '^\k*') " Includes inserting word
  endif
  silent! call matchdelete(w:cursorword_id0)
  silent! call matchdelete(w:cursorword_id1)
  let pattern0 = '\<' . escape(word0, '~"\.^$[]*') . '\>'
  let pattern1 = '\<' . escape(word1, '~"\.^$[]*') . '\>'
  let w:cursorword_id0 = matchadd('CursorWord0','\%>'.(line('w0')).'l'.'\%<'.(line('w$')).'l'. pattern0, -1)
  let w:cursorword_id1 = matchadd('CursorWord1','\%'.line('.').'l'.pattern1,-1)
endfunction "}}}
autocmd VimEnter,ColorScheme     * call MyCursorwordHighlight()
autocmd CursorMoved,CursorMovedI * call MyCursorwordMatchadd()
