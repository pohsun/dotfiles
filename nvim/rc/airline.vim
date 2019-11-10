" let g:airline_theme='wombat' " Supported with the gruvbox colortheme

let g:airline_section_warning = ''
let g:airline_section_b = ''
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 0
let g:airline_left_sep = '>'
let g:airline_left_alt_sep = '«'
let g:airline_right_sep = '<'
let g:airline_left_alt_sep = '»'
let g:airline_symbols.linenr = 'Ln'
let g:airline_symbols.branch = 'Br'
let g:airline_symbols.paste = 'Paste'
let g:airline_symbols.readonly = '[RO]'
let g:airline_symbols.whitespace = ' '
let g:airline#extensions#tabline#left_sep = '>'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_fnamemod = ':p:.'
        " enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_close_button = 0
        " extensions
let g:airline#extensions#tagbar#enabled = 0
