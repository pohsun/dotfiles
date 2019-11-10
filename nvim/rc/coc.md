# COC.nvim

This plugin use `$VIMRUNTIME/coc-settings.json` for the compatibility with VSCode.
Here I just keeps notes for installation and configuration

You'll need `node` to run binary, get the binary with
```
curl -sL install-node.now.sh > install.sh
chmod +x install.sh
/install.sh --prefix="${HOME}/.local/usr"
```
Make sure `${HOME}/usr/bin` in `$PATH` so CoC could work fine.


# `:CosList marketplace`, `:CosList extensions` as Extension manager

First of all, install coc-marketplace with `:CocInstall coc-marketplace` and list all available extensions with `:CosList marketplace`

Manage all installed extensions with `:CosList extensions`

Here's the list of all installed extensions

```
coc-marketplace
coc-exploror
coc-syntax
coc-lists
coc-snippets
coc-pairs
coc-python
coc-texlab
coc-json
```


# LSP configuration

* Protocal servers and linters has to be installed independently.


## snippet

* Use `coc-snippet` with `https://github.com/honza/vim-snippets`

## python

* Make sure you've installed [`python-language-server`](https://github.com/palantir/python-language-server).

* Default setting can be found [here](https://github.com/neoclide/coc.nvim/wiki/Language-servers#python).

## cpp

* You'll need `clang` command from `llvm`, install it with homebrew.

## latex

# `CoCList`: Fuzzy search and listing
