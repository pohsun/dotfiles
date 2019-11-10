let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " let ctrlP perform search under selected path
nnoremap <silent> <F5> : NERDTreeTabsToggle<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_open_new_file = 't'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_depth = 10
let g:ctrlp_max_files = 1000
let g:ctrlp_user_command = 'find %s -type f'
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden -i -g ""'
    set grepprg=ag\ --nogroup\ --nocolor\ --hidden
elseif executable('ack')
    set grepprg=ack\ --nogroup\ --nocolor\ -H
else
endif
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' } " Use FZF for instead
let g:ctrlp_lazy_update = 350
let tagbar_width=50
let g:tagbar_compact=1
