" vim: set ts=2 sw=2 ft=vim fdm=manual:

" Define system environment
let s:uname = system("uname -s")
let s:hostname = system("echo $HOSTNAME")
let g:lxHome = $HOME.'/.config/nvim/'
let g:vimenv = $HOME.'/.local/nvim'
function! s:MyRCLoader(fname)
  if filereadable(g:lxHome.'rc/'.a:fname)
    exec 'source '.g:lxHome.'rc/'.a:fname
  endif
endfunction

if !filereadable(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  echo "Installing vim-plug...\n"
  !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

set nocompatible
filetype off
call plug#begin(g:vimenv.'/bundle')
  " Indexing commands (including toggle options)
Plug 'liuchengxu/vim-which-key'

  " Basic function enhancements
Plug 'skywind3000/asyncrun.vim'
Plug 'rcarriga/nvim-notify'
Plug 'simnalamburt/vim-mundo'  " Visualize undo tree
"Plug 'neovim/nvim-lspconfig'  " Official tutorial for the builtin LSP since nvim 0.7+

  " The lookings, you sholuld get powerline-fonts by yourself.
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox', {'dir': g:vimenv.'/colors/gruvbox'}
"Plug 'nanotech/jellybeans.vim', {'dir': g:vimenv.'/colors/jellybeans.vim'}
Plug 'psliwka/vim-smoothie'
Plug 'Yggdroot/indentLine'
Plug 'szw/vim-maximizer' " This may be useful if there's no tmux
"Plug 'andymass/vim-matchup' " Takes too much time at startup, try deferred highlighting?
"Plug 'valloric/MatchTagAlways' " Slow on lxplus

"  " Editting plugins
Plug 'scrooloose/nerdcommenter'
Plug 'godlygeek/tabular', {'on': 'Tabular'}
" Plug 'junegunn/vim-easy-align'
Plug 'triglav/vim-visual-increment'
"Plug 'mg979/vim-visual-multi'
"Plug 'jiangmiao/auto-pairs'

"  " Enhance searching through tags, buffer, files, file context, ets..
"  " Most functions integrated to CoCList
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'liuchengxu/vista.vim' " Enhanced tagbar

  " In-buffer movement/selection
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kshenoy/vim-signature' " Enhanced markers
Plug 'gcmt/wildfire.vim' " Quick selection of quoted region
Plug 'matze/vim-move' " Magic move in Visual modes with <A-hjkl>

"  " DevTools
let g:coc_node_path = '/usr/local/bin/node'
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Also replaces fzf with CocList
Plug 'honza/vim-snippets'
"if filereadable($HOME.'/local/LanguageTool/languagetool-commandline.jar')
"  let g:languagetool_jar='$HOME/local/LanguageTool/languagetool-commandline.jar'
"  " Another powerful version in https://github.com/rhysd/vim-grammarous
"  Plug 'dpelle/vim-LanguageTool', {'for': ['html', 'md', 'rst', 'tex']}
"endif
"Plug 'w0rp/ale' " Linter, works fine with CoC

"  " ft-extensions, specify install path to 'syntax' for syntax only.
"Plug 'nvim-treesitter/nvim-treesitter'
Plug 'octol/vim-cpp-enhanced-highlight', {'dir': g:vimenv.'/syntax/vim-cpp-enhanced-highlight'}
Plug 'Mizuchi/STL-Syntax', {'dir': g:vimenv.'syntax/STL-Syntax'}
Plug 'dccsillag/magma-nvim', {'do': ':UpdateRemotePlugins', 'branch': 'main'}  " Run jupyter within nvim
"Plug 'JuliaEditorSupport/julia-vim', {'dir': g:vimenv.'/syntax/julia-vim'}
"Plug 'rust-lang/rust.vim', {'dir': g:vimenv.'/syntax/rust.vim'}
"Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }
"Plug 'othree/html5.vim', {'dir': g:vimenv.'/syntax/html5.vim'}
"Plug 'ap/vim-css-color'
"Plug 'StanAngeloff/php.vim', {'dir': g:vimenv.'/syntax/php.vim'}
if s:hostname == "localhost\n" || s:uname == "Darwin\n"
  Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
  Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
  Plug 'reedes/vim-pencil'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()} }
  Plug 'aklt/plantuml-syntax', {'dir': g:vimenv.'/syntax/plantuml-syntax'}
  "Plug 'xuhdev/vim-latex-live-preview', {'for': ['tex']}
  "Plug 'tpope/vim-surround', {'for': ['html', 'xhtml', 'xml']}
  "Plug 'chusiang/vim-sdcv'
endif
call plug#end()
filetype plugin indent on

" Vim settings
let g:LargeFile = 20
let g:python_host_prog=$HOME.'/.pyenv/shims/python2'
let g:python3_host_prog=$HOME.'/.pyenv/shims/python3'
let g:node_host_prog='/usr/local/bin/neovim-node-host'
set modeline
set modelines=5                     " OSX set default value to 0
set history=50                      " keep N lines of command line history
set undofile
set undodir=~/.vim/undo
set viminfo='20,\"50,:20,%          " read/write a .viminfo file.
set ttyfast
set visualbell
set showcmd
if has('mouse')
  set mouse=""
  nmap <LeftMouse> <nop>
endif   " Allow mouse in normal mode only.
set wildmenu
set wildmode=longest,list
set wildignore+=*.o,*.a,*.so,*.obj,*.exe,*.lib
set wildignore+=*.pyc
set wildignore+=*.png,*.jpg,*.gif,*.pdf
"set wildignore+=*.root
set completeopt=menuone,longest,noinsert
set complete=.,b,t,i,k " see :h cpt
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set ignorecase
set smartcase
set incsearch
set showmatch
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif " Jump to last known position
if &term =~ "xterm.*"
  " Toggle paste automatically. Check pastemode bracketing ON in terminal
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te
  function! XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction
  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif

" Encoding
set fileformat=unix
set fileformats=unix,mac,dos
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,euc-jp,big5,cp936,gb18030,latin1
set fileencoding=utf-8 " Write file with this encoding
set spelllang=en_us

" Typesettings
set autoindent
set t_kb=
set backspace=indent,eol,start      " allow backspacing over everything in insert mode
set whichwrap=b,s                   " set whichwrap=b,s,<,>,[,]
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=15
set virtualedit=block
set expandtab                       " replace all tab with space
set list
set listchars=tab:\|\-,conceal:+,trail:-
set conceallevel=2
set concealcursor=""                " Don't Hide markers
set fdm=marker                      " syntax/text
set foldlevel=0
set foldnestmax=2
set wrap
set linebreak

" ColorScheme setting, check schemes by :colo <TAB>
" Check current highlight by :highlight
set t_Co=256
set background=dark
set hls                             " highlight search result
set ruler                           " show the cursor position all the time
set cursorcolumn                    " highlight current column position
set number
set relativenumber
set numberwidth=4                   " width of line-number
set guicursor=n-v-c-sm-i-ci-ve:block,r-cr-o:hor20 " cursor-styling

" " Filetype settings to be moved to after/ftplugin
"     " c and cpp
" let g:cpp_class_scope_highlight = 1
" 
"     " Quick compile settings, run compile by :make or <F9> in normal mode
" nnoremap <unique> <buffer> <silent> <F9> :make!<CR>
" if !filereadable(expand("%:p:h")."/Makefile")
"     autocmd Filetype c,cpp      setlocal makeprg=g++\ -Werror\ -o\ %<\ %\ &&\ ./%:r
" endif

" " Plugin settings
call s:MyRCLoader("vim-mundo.vim")
call s:MyRCLoader("colorscheme.vim")
call s:MyRCLoader("airline.vim")
call s:MyRCLoader("indentLine.vim")
call s:MyRCLoader("nvim-lspconfig.vim")             " Official LSP support
call s:MyRCLoader("coc.vim")                        " Load after all schemes are on.
call s:MyRCLoader("Goyo_Limelight.vim")             " Concentrate in writing
call s:MyRCLoader("vim-maximizer.vim")              " <leader>wz to zoom
call s:MyRCLoader("ctrlsf.vim")                     " Enhanced grep under workspace
call s:MyRCLoader("incsearch.vim")                  " Incsearch x Fuzzyspell x easymotion
call s:MyRCLoader("easymotion.vim")                 " Genious jumping method
call s:MyRCLoader("aerojump.vim")                   " Genious jumping method for long document
call s:MyRCLoader("vista.vim")                      " Modern tagbar
call s:MyRCLoader("nerdcommenter.vim")
let g:mta_filetypes = {'html' : 1, 'xhtml' : 1, 'xml' : 1} " MatchTagAlways
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "i`", "ip"] " wildfire
" let g:surround_insert_tail = "<++>"
call s:MyRCLoader("markdown-preview.vim")
"call s:MyRCLoader("latexPreview.vim")

" OS specified settings, see ':h feature-list'
"if s:uname == "Darwin\n"
"endif

" Basic key-bindings
nnoremap <F1>  <nop>
nnoremap 0     ^
inoremap jj    <ESC>
inoremap <C-w> <C-[>diwi
nnoremap dw    diw
nnoremap <nowait><silent> <ESC><ESC> :noh<CR>
command! W     w
command! Q     q
command! Wq    wq
inoremap <expr> <CR>    pumvisible() ? "\<C-Y>" : "\<CR>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Other functions, rule: Start with 'My', <leader>
    " templates, headers, and timestamps
function! MyAutoTemplate(fsize) "{{{
    if a:fsize <= 0 && filereadable(g:lxHome.'templates/tpl.'.&ft)
        exec 'norm gg'
        exec "0r ".g:lxHome."templates/tpl.".&ft
        echo "Load template for filetype:".&ft
    endif
endfunction "}}}
command! MyAutoTemplate call MyAutoTemplate(0)
autocmd BufRead,BufNewFile * call MyAutoTemplate(getfsize(@%))

function! MyRangeSearch(direction) "{{{ search in visual range
  call inputsave()
  let g:srchstr = input(a:direction)
  call inputrestore()
  if strlen(g:srchstr) > 0
    let g:srchstr = g:srchstr.'\%>'.(line("'<")-1).'l'.'\%<'.(line("'>")+1).'l'
  else
    let g:srchstr = ''
  endif
 endfunction "}}}
vnoremap <silent> / :<C-U>call MyRangeSearch('/')<CR>:if strlen(g:srchstr) > 0\|exec '/'.g:srchstr\|endif<CR>
vnoremap <silent> ? :<C-U>call MyRangeSearch('?')<CR>:if strlen(g:srchstr) > 0\|exec '?'.g:srchstr\|endif<CR>

" Register all key-mappings
call s:MyRCLoader("vim-which-key.vim")                " Always at the very end for register all commands
