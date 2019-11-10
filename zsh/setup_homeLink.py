#!/usr/bin/env python
# Please follow py27

from __future__ import print_function

import os
import shutil
from subprocess import call

CWD = os.path.abspath(os.path.dirname(__file__))
HOME = os.path.expandvars("$HOME")
lxHome = HOME + "/Dropbox/lxHome"
os.environ['lxHome'] = lxHome

# Create directories
if not os.path.exists(HOME + "/local/bin"):
    os.makedirs(HOME + "/local/bin")
    os.chmod(HOME + "/local", 755)
    os.chdir(HOME + "/local")
    os.makedirs("package")
    os.makedirs("usr/bin")
    os.makedirs("usr/lib")
    os.makedirs("usr/include")

if not os.path.exists(HOME + '/lxHome'):
    call("ln -s ${HOME}/Dropbox/lxHome ${HOME}/lxHome", shell=True)

if not os.path.exists(HOME + "/.zshrc"):
    call("ln -s ${lxHome}/scripts/setEnv/zsh/zshrc ${HOME}/.zshrc", shell=True)
elif not os.path.islink(HOME + "/.zshrc"):
    os.rename(HOME + "/.zshrc", HOME + "/.zshrc_old")
    call("ln -s ${lxHome}/scripts/setEnv/zsh/zshrc ${HOME}/.zshrc", shell=True)

if not os.path.exists(HOME + "/.p10k.zsh"):
    call("ln -s ${lxHome}/scripts/setEnv/zsh/p10k.zsh ${HOME}/.p10k.zsh", shell=True)

if not os.path.exists(HOME + "/init.zsh"):
    call("ln -s ${lxHome}/scripts/setEnv/zsh/init.zsh ${HOME}/init.zsh", shell=True)

call("ln -s ${lxHome}/scripts/setEnv/tmux.conf ${HOME}/.tmux.conf", shell=True)

# Vim and neovim
# if not os.path.exists(HOME + "/.vimrc"):
#     call("ln -s ${lxHome}/scripts/setEnv/vimrc ${HOME}/.vimrc", shell=True)
#     call("ln -s ${lxHome}/scripts/setEnv/vim ${HOME}/.vim", shell=True)
# elif not os.path.islink(HOME + "/.vimrc"):
#     os.rename(HOME + "/.vimrc", HOME + "/.vimrc_old")
#     os.rename(HOME + "/.vim", HOME + "/.vim_old")
#     call("ln -s ${lxHome}/scripts/setEnv/vimrc ${HOME}/.vimrc", shell=True)
#     call("ln -s ${lxHome}/scripts/setEnv/vim ${HOME}/.vim", shell=True)

if not os.path.exists(HOME + "/.config"):
    os.makedirs(HOME + "/.config")
    call("ln -s ${lxHome}/scripts/setEnv/nvim ${HOME}/.config/", shell=True)
    call("ln -s ${lxHome}/scripts/setEnv/gitconfig ${HOME}/.gitconfig", shell=True)


# ROOT environment
call("ln -s ${lxHome}/scripts/root/rootrc ${HOME}/.rootrc", shell=True)
call("ln -s ${lxHome}/scripts/root/rootlogon.C ${HOME}/.rootlogon.C", shell=True)

# Final check
print("Environment built, remember to check if '${HOME}lxHOME' exists.")
