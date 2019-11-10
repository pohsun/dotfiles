#!/usr/bin/env bash

# Build a cozy environment.

# Create directories
if [ ! -d ${HOME}/local/bin ]; then
    mkdir -p ${HOME}/local/bin
    mkdir -p ${HOME}/local/package
    mkdir -p ${HOME}/local/usr/bin
    mkdir -p ${HOME}/local/usr/lib
    mkdir -p ${HOME}/local/usr/include
fi

lxHome="${HOME}/lxHome"
if [ -d ${HOME}/Dropbox ]; then
    ln -s ${HOME}/Dropbox/lxHome ${HOME}/lxHome
fi

# Creating symbolic links to $HOME
#ln -s ${lxHome}/scripts/setEnv/cshrc ${HOME}/.cshrc
#ln -s ${lxHome}/scripts/setEnv/logout ${HOME}/.logout
#if [ ! -e ${HOME}/init.sh ]; then
#    cp init.csh ${HOME}
#fi

if [ ! -e ${HOME}/.bashrc ]; then
    ln -s ${lxHome}/scripts/setEnv/bash/bashrc ${HOME}/.bashrc
elif [ ! -L ${HOME}/.bashrc ]; then
    mv ${HOME}/.bashrc ${HOME}/.bashrc_old
    ln -s ${lxHome}/scripts/setEnv/bash/bashrc ${HOME}/.bashrc
fi
if [ ! -e ${HOME}/.bash_logout ]; then
    ln -s ${lxHome}/scripts/setEnv/bash/bash_logout ${HOME}/.bash_logout
elif [ ! -L ${HOME}/.bash_logout ]; then
    mv ${HOME}/.bash_logout ${HOME}/.bash_logout_old
    ln -s ${lxHome}/scripts/setEnv/bash/bash_logout ${HOME}/.bash_logout
fi
if [ ! -e "${HOME}/init.sh" ]; then
    cp ${lxHome}/scripts/setEnv/bash/init.sh ${HOME}
fi

#
if [ ! -e ${HOME}/.vimrc ]; then
    ln -s ${lxHome}/scripts/setEnv/vimrc ${HOME}/.vimrc
    ln -s ${lxHome}/scripts/setEnv/vim ${HOME}/.vim
elif [ ! -L ${HOME}/.vimrc ]; then
    mv ${HOME}/.vimrc ${HOME}/.vimrc_old
    ln -s ${lxHome}/scripts/setEnv/vimrc ${HOME}/.vimrc
    mv ${HOME}/.vim ${HOME}/.vim_old
    ln -s ${lxHome}/scripts/setEnv/vim ${HOME}/.vim
fi

ln -s ${lxHome}/scripts/setEnv/nvim ${HOME}/.config/
ln -s ${lxHome}/scripts/setEnv/gitconfig ${HOME}/.gitconfig
#ln -s ${lxHome}/scripts/setEnv/screenrc ${HOME}/.screenrc
cp ${lxHome}/scripts/setEnv/tmux.conf ${HOME}/.tmux.conf

# setup root environment
ln -s ${lxHome}/scripts/root/rootrc ${HOME}/.rootrc
ln -s ${lxHome}/scripts/root/rootlogon.C ${HOME}/.rootlogon.C

# Create basic categories except than scripts(optional)
chmod 755 ${HOME}/local                             # local programs
#mkdir ${HOME}/public;chmod 755 ${HOME}/public      # public for guests
#mkdir ${HOME}/upload;chmod 777 ${HOME}/upload      # upload form guests
#mkdir ${HOME}/TEMP                                 # link/dir for temp

# Final check
echo "Environment built, remember to check 'lxHOME' path."
echo "For OSX, add \"source ~/.bashrc\" in \"~/.profile\"".
