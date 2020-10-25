# COC.nvim

This plugin use `$VIMRUNTIME/coc-settings.json` for the compatibility with VSCode.
Here I just keeps notes for installation and configuration

* You'll need updated `node` to run binary, get the binary with
    ```
    curl -sL install-node.now.sh > install.sh
    chmod +x install.sh
    ./install.sh --prefix="${HOME}/local/usr"
    ```
    Make sure you're using private with `which node` so CoC could work fine.

* If you're unable to properly install CoC with plug manager.
    
    Go to `${HOME}/.local/nvim/coc.nvim` and run `install.sh`

* More about configuration: https://github.com/neoclide/coc.nvim/wiki/Using-the-configuration-file

# `:CosList marketplace`, `:CosList extensions` as an Extension manager

First of all, install `coc-marketplace` with `:CocInstall coc-marketplace` and list all available extensions with `:CosList marketplace`

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

It's easier to build all needed stuff using an [automation script](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim#automation-script).

# LSP configuration

More example setup on [wiki](https://github.com/neoclide/coc.nvim/wiki/Language-servers)

## snippet

* Use `coc-snippet` with `https://github.com/honza/vim-snippets`

## python

* Make sure you've installed [`python-language-server`](https://github.com/palantir/python-language-server) with `pip3 install 'python-language-server[all]'`.

* Default setting can be found [here](https://github.com/neoclide/coc.nvim/wiki/Language-servers#python).

## cpp

Two options: `clang` and `ccls`, I prefer `clang`

* `clang`: You'll need `clang` command from `llvm`, install it with homebrew. 
On `lxplus`, it is tested to be fine with SUSE binary.
Don't forget to change the binary location in `coc-settings.json`.

* `ccls`: See example configuration at https://github.com/MaskRay/ccls/wiki/coc.nvim

## latex

# `CoCList`: Fuzzy search and listing
