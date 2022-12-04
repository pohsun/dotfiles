set timeoutlen=400
let g:mapleader="\<Space>"
let g:maplocalleader=","

nnoremap <silent> <leader> :<C-U>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-U>WhichKeyVisual '<Space>'<CR>
let which_key_map = {
    \ 'c' : {'name': '+NerdCommenter'},
    \ 't' : {
        \ 'name': '+Toggle',
        \ 'p': [':set rnu! nu! list! paste!| IndentLinesToggle"', "Copy/Paste"],
        \ 'w': [':TogglePencil', "Pencil"],
        \ 'U': [':MundoToggle', "Undo tree"],
        \ '5': [':CocCommand explorer', "File Explorer"],
        \ '6': [':Vista coc', "Tagbar"],
        \ },
    \ '/' : {
        \ 'name': '+Search',
        \ '/': ['<Plug>(incsearch-fuzzyall-stay)', "FuzzyString"],
        \ '#': [':call MyCtrlSFLocal()', "CursorWord"],
        \ 'f': [':CocList files', "File"],
        \ 'm': [':CocList mru', "MRU File"],
        \ 't': [':CocList symbols', "Tag"],
        \ 'g': [':CocList grep', "x-File grep"],
        \ 'b': [':CocList buffers', "Buffer"],
        \ 'w': [':CocList windows', "Window"],
        \ 'G': ['<Plug>CtrlSFPrompt', "CtrlSF"],
        \ 'C': [':CocList', "CoCList"],
        \ },
    \ 'l' : {
        \ 'name': '+FileType-specified',
        \ 'F': ['<Plug>(coc-format-selected)', "FormatSelected"],
        \ },
    \ 'j' : {
        \ 'name': '+Easymotion',
        \ 'f' : [ '<Plug>(AerojumpBolt)', "Fuzzy"],
        \ 'j' : [ '<Plug>(easymotion-sn)', "N-char"],
        \ 'l' : [ '<Plug>(easymotion-bd-jk)', "LineNo"],
        \ 'a' : [ '<Plug>(easymotion-lineanywhere)', "Anywhere inline"],
        \ },
    \ 'w' : {
        \ 'name': '+Window',
        \ 'z': [':MaximizerToggle', "Zoom in/out"],
        \ 'f': [':Goyo', "Focus mode"],
        \ 'b': [':CocList buffers', "GoTo Buffer"],
        \ 'w': [':CocList windows', "GoTo Window"],
        \ }
    \ }
call which_key#register('<Space>', "g:which_key_map")

nnoremap <silent> <F5> :CocCommand explorer<CR>
nnoremap <silent> <F6> :Vista coc<CR>
nnoremap <silent> <C-P> :CocList<CR>

" nnoremap <silent> <ESC><ESC> :nohl<CR>
