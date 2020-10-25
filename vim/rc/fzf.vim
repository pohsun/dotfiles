nnoremap <C-P> :FZF<CR>

let g:fzf_tags_command = 'ctags -R'
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" TODO: My customized fuzzy search
function! s:fzf_MruFileTag()
    let current_file =expand("%")
    let cwd = fnamemodify(current_file, ':p:h')
    let command = 'ag -g "" -f ' . cwd . ' --depth 0'
    call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s'})
endfunction
"command! MyFZF call s:fzf_MruFileTag()
