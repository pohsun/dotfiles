let g:syntastic_mode_map = { "mode": "passive",
                           \ "active_filetypes": ['javascript', 'tcl' , 'markdown'],
                           \ "passive_filetypes": ['sh', 'c' , 'cpp', 'python', 'tex'] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_jump = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_python_checkers = ['pylint', 'python']
let g:syntastic_python_pylint_args = "-disable=C0301,C0103,R0914,R0903"
if system("which root-config") != ""
    let g:syntastic_c_compiler_options = substitute(system("root-config --incdir"),'\(^.*\)\n$','=std=c11 -Werror -I\1','')
    let g:syntastic_cpp_compiler_options = substitute(system("root-config --incdir"),'\(^.*\)\n$','-std=c++14 -Werror -I\1','')
endif
