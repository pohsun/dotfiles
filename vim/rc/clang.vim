" Copy the same option from ale.vim

let g:clang_cpp_options  = " -Werror"
    " Options for macport
let g:clang_cpp_options .= " -I/opt/local/include"
    " Options for ROOT
let g:clang_cpp_options .= "-pthread -stdlib=libc++ -std=c++1z -m64 -I/opt/local/libexec/root6/include/root"
let g:clang_c_options   = substitute(g:clang_cpp_options,'\(-std=.* \)','-std=c11 ','')

call deoplete#custom#var('clangx', 'default_cpp_options', g:clang_cpp_options)
call deoplete#custom#var('clangx', 'default_c_options'  , g:clang_c_options)

