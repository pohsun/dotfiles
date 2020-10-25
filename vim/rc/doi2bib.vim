function doi2bib(url)
    :!r curl url | grep "@article"
endfunction
