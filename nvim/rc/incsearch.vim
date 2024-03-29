if isdirectory(g:vimenv.'/bundle/incsearch.vim')
    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    map // <Plug>(incsearch-fuzzy-stay)
	
    function! s:config_fuzzyall(...) abort
	  	return extend(copy({
	  		\ 'converters': [
	  			\ incsearch#config#fuzzy#converter(),
	  			\ incsearch#config#fuzzyspell#converter()
	  		\ ],
	  	\ }), get(a:, 1, {}))
	endfunction

    noremap <silent><expr> <Plug>(incsearch-fuzzyall-stay) incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
endif
