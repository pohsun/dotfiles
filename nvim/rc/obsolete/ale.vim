if system("which root-config") != ""
    let g:ale_cpp_gcc_options = "-Werror"
    let g:ale_cpp_gcc_options = g:ale_cpp_gcc_options." ".system("root-config --cflags")
endif

let g:ale_cpp_gcc_options  .= " -I/opt/local/include"
let g:ale_cpp_clang_options = g:ale_cpp_gcc_options
let g:ale_c_gcc_options     = substitute(g:ale_cpp_gcc_options,'\(-std=.* \)','-std=c11 ','')
let g:ale_c_clang_options   = g:ale_c_gcc_options

" python linters
" https://pycodestyle.readthedocs.io/en/latest/intro.html#error-codes
let g:ale_python_flake8_options = "--ignore E24,W504"
" http://pylint-messages.wikidot.com/all-codes
let g:ale_python_pylint_options = "-d C011,E0611"

" python fixer
" https://github.com/hhatto/autopep8
let g:ale_python_autopep8_options = "--ignore E226,E24,W50,W690"

" See: http://www.nongnu.org/chktex/ChkTeX.pdf
let g:ale_tex_chktex_options = "-I -n 8,13,24"
