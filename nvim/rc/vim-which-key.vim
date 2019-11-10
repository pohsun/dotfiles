set timeoutlen=400
let g:mapleader="\<Space>"
let g:maplocalleader=","

nnoremap <silent> <leader> :<C-U>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-U>WhichKeyVisual '<Space>'<CR>
let which_key_map = {
    \ 'c' : {'name': '+NerdCommenter'},
    \ 't' : {
        \ 'name': '+Toggle',
        \ 'n': [':set rnu! nu!', "LnNum"],
        \ 'p': [':set paste!', "Paste"],
        \ 'w': [':set wrap!', "LnWrap"],
        \ 'i': [':IndentLinesToggle', "IndentLines"],
        \ 'T': [':FloatermToggle', "Terminal"],
        \ 'U': [':MundoToggle', "Undo tree"],
        \ '5': [':CocCommand explorer', "File Explorer"],
        \ '6': [':Vista coc', "Tagbar"],
        \ },
    \ '/' : {
        \ 'name': '+Search',
        \ '/': [':CocList words', "Word"],
        \ '#': [':call MyCtrlSFLocal()', "CursorWord"],
        \ 'f': [':CocList files', "File"],
        \ 'm': [':CocList mru', "MRU File"],
        \ 't': [':CocList symbols', "Tag"],
        \ 'g': [':CocList grep', "x-File grep"],
        \ 'G': ['<Plug>CtrlSFPrompt', "CtrlSF"],
        \ 'C': [':CocList', "CoCList"],
        \ },
    \ 'l' : {'name': '+FileType-specified'},
    \ 'j' : {
        \ 'name': '+Easymotion',
        \ 'j' : [ '<Plug>(easymotion-sn)', "N-char"],
        \ '0' : [ '<Plug>(easymotion-bd-jk)', "LineNo"],
        \ 'a' : [ '<Plug>(easymotion-lineanywhere)', "Anywhere inline"],
        \ 'l' : [ '<Plug>(easymotion-sln)', "2-char inline"],
        \ },
    \ 'w' : {
        \ 'name': '+Window',
        \ 'z': [':MaximizerToggle', "Zoom in/out"],
        \ 'f': [':Goyo', "Focus mode"],
        \ }
    \ }
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <F5> :CocCommand explorer<CR>
nnoremap <silent> <F6> :Vista coc<CR>
nnoremap <silent> <C-P> :CocList<CR>

