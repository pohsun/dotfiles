let g:goyo_width = 84
let g:goyo_height = 85
let g:goyo_linenr = 2
let g:goyo_tmp_hiFolded = g:jellybeans_background_color_256

function! s:goyo_enter()
    let &scrolloff=999-&scrolloff
    Limelight
endfunction

function! s:goyo_leave()
    let &scrolloff=999-&scrolloff
    Limelight!
    "hi Search cterm=bold,standout
    exec "hi Folded ctermbg=".g:goyo_tmp_hiFolded
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:limelight_conceal_ctermfg = 240
let g:limelight_default_coefficient = 0.7
let g:limelight_paragraph_span = 1
let g:limilight_priority = -1

