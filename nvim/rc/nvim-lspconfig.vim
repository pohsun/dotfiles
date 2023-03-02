" See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
if isdirectory(g:vimenv.'/bundle/nvim-lspconfig.vim')
    " C & Cpp

    " Python
    require'lspconfig'.pyright.setup{}
endif
