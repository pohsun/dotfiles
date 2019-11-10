#!/usr/bin/env sh

###### Setting for local machines
if [ `uname -s` == "Linux" ]; then
    if [ `lsb_release -i | grep -c -e Scientific -e RedHat -e CentOS` == 1 ]; then
        # [RHEL/CentOS/SL]
        source /etc/profile.d/bash_completion.sh
        #echo "scl enable devtoolset-3 'bash'"
    elif [ `lsb_release -i | grep -c -e Debian -e Ubuntu` == 1 ]; then
        # [Debian/Ubuntu]
        source /etc/profile.d/bash_completion.sh
        source ${lxHome}/scripts/OS/linux/setWindowTransparency.sh 85
    #elif [ `lsb_release -i | grep -c -e Arch` == 1 ]; then
        # [Arch/Gentoo]
    fi
    
    export LS_COLORS='di=1;36;40:ln=1;35;40:so=1;32;40:pi=1;33;40:ex=1;31;40:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:' # See: http://geoff.greer.fm/lscolors/
    export PYTHONPATH=${PYTHONPATH}:/usr/local/lib/python2.7/dist-packages/:/usr/lib/python2.7/dist-packages/
elif [ `uname -s` == "Darwin" ]; then
    PS1='\[\e[32m\][\u@local]\[\e[m\] \[\e[4;33m\]\w\[\e[m\]\n\[\e[7;31m\]\$>>\[\e[0m\] '

    # colored ls
    unalias ls
    alias ls='ls -wG'
    export LSCOLORS=GxFxCxDxBxegedabagaced
    alias indent='gnuindent'

    ### CJK input in terminal
    bind 'set convert-meta off'
    bind 'set meta-flag on'
    bind 'set output-meta on'

    ### MacPort
    export PATH=/opt/local/bin:${PATH}
    alias gcc='/Applications/Xcode.app/Contents/Developer/usr/bin/gcc'
    alias g++='/Applications/Xcode.app/Contents/Developer/usr/bin/g++'
    export ROOTSYS="/opt/local/libexec/root6"

    ### Python
    export PYTHONPATH="${PYTHONPATH}:${ROOTSYS}/lib"
    export PATH="${PATH}:/Users/pchen/Library/Python/Current/bin:/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin"

    ### GO
    export GOPATH='/usr/local/go/bin'

    ### Julia
    export PATH="${PATH}:/Applications/Julia-1.0.app/Contents/Resources/julia/bin"

    ### Rust
    export PATH="${PATH}:${HOME}/.cargo/bin"
fi
export PATH=${PATH}:${HOME}/.local/bin

### C and CPP environment
#export C_INCLUDE_PATH=""
#export CPLUS_INCLUDE_PATH=""

### PYTHON environment
#export PYTHONPATH="$PYTHONPATH"

### Rubygem environment
export GEM_HOME="${HOME}/.gem"
export PATH=${PATH}:${GEM_HOME}/bin

### vim
#alias vim="LD_LIBRARY_PATH="" /opt/local/bin/vim -p"
alias vim="nvim"
alias nv="nvim"

### ROOT environment, remark '-lRooFit -lRooFitCore' should be included by hand.
if [ -e ${HOME}/local/root/bin/thisroot.sh ]; then
    source ${HOME}/local/root/bin/thisroot.sh
fi
alias root='root -l -t'
alias groot='g++ -g `root-config --cflags --glibs` -lRooFit -lRooFitCore'

###### Variables and alias
#export lxHome="${HOME}/lxHome"     # Set in .bashrc
alias pcTW='ssh -YC pchen@220.135.8.229'
lxplus() {
    nodeId=$1
    if [[ ${nodeId} == '' ]]; then
        ssh -YC pchen@lxplus7.cern.ch
    elif [[ ${nodeId} == 'tmux' ]]; then
        ssh -YC $(tail -n 1 ~/tmux.log) -t /afs/cern.ch/user/p/pchen/local/usr/bin/tmux a
    elif [[ ${nodeId} == 'pyu' ]]; then
        ssh -YC pyu@lxplus7.cern.ch
    else
        ssh -YC pchen@lxplus${nodeId}.cern.ch
    fi
}
ntugrid5() {
    nodeId=$1
    if [[ ${nodeId} == 'pyu' ]]; then
        ssh -YC pyu@140.112.104.121
    else
        ssh -YC pchen@140.112.104.121
    fi
}
alias hep1='ssh -YC phchen@hep1.phys.ntu.edu.tw'
alias mars='ssh -YC phchen@mars.phys.ntu.edu.tw'
alias nodes='$(printf "ssh -YC node%02d" $((${RANDOM} % 20 + 1)))'

###### Bash completion
source ${lxHome}/scripts/setEnv/bash/bash_completion_tmux.sh
source ${lxHome}/scripts/setEnv/bash/bash_completion_bd.sh

###### fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

###### remove duplicated path
PATH=`perl -e '@A=split(/:/,$ENV{PATH});%H=map {$A[$#A-$_]=>$#A-$_} (0..$#A);@A=join(":",sort{$H{$a} <=> $H{$b} }keys %H);print "@A"'`
export PATH
PYTHONPATH=`perl -e '@A=split(/:/,$ENV{PYTHONPATH});%H=map {$A[$#A-$_]=>$#A-$_} (0..$#A);@A=join(":",sort{$H{$a} <=> $H{$b} }keys %H);print "@A"'`
export PYTHONPATH
