#!/usr/bin/env zsh
# vim: set sts=4 sw=4 fdm=syntax fdl=0 fdn=2 et:

export lxHome="${HOME}/lxHome"
export EDITOR="vim"
export NoteLib="${HOME}/MWeb"

###### Setting for local machines
if [ `uname -s` = "Linux" ]; then
    if [ `lsb_release -i | grep -c -e Debian -e Ubuntu` == 1 ]; then
        # [Debian/Ubuntu]
        source ${lxHome}/scripts/OS/linux/setWindowTransparency.sh 85
    fi
elif [ `uname -s` = "Darwin" ]; then
    # colored ls
    unalias ls
    alias ls='ls -wG'
    export LSCOLORS=GxFxCxDxBxegedabagaced
    alias indent='gnuindent'

    # Homebrew
    # If /usr/local/bin not in /etc/paths
    # export PATH="${PATH}:/usr/local/bin"

    ### C and CPP environment
    #export C_INCLUDE_PATH=""
    #export CPLUS_INCLUDE_PATH=""
    #export LDFLAGS="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
    #export CPPFLAGS="-I/usr/local/opt/llvm/include"

    ### PYTHON environment
    export PYENV_ROOT="${HOME}/.pyenv"
    export SYSTEM_PYTHON2_PATH="${HOME}/Library/Python/2.7"
    export SYSTEM_PYTHON3_PATH="${HOME}/Library/Python/3.8"
    export PATH="${PYENV_ROOT}/bin:${SYSTEM_PYTHON3_PATH}/bin:${SYSTEM_PYTHON2_PATH}/bin:${PATH}"
    eval "$(pyenv init -)"

    ### GO
    export GOPATH='/usr/local/go/bin'

    ### Ruby
    export PATH="${HOME}/.gem/ruby/2.6.0/bin:${PATH}"
fi
export PATH="${HOME}/local/bin:${HOME}/.local/bin:${PATH}"
if hash nvim 2>/dev/null; then
    alias vim='nvim'
fi

### ROOT environment, remark '-lRooFit -lRooFitCore' should be included by hand.
# Some problem with thisroot.sh if root binary is in some shared path like '/usr/local/bin'.
# The procedure removing current version might hurt the $PATH, have to check /etc/paths to resotre some system-wide path.

# As of ROOT 6.22, you should not need the thisroot scripts;
# if [[ -f /usr/local/bin/thisroot.sh ]]; then
#     [[ ! -z $TMUX ]] && unset ROOTSYS
#     pushd /usr/local >/dev/null; . bin/thisroot.sh; popd >/dev/null
# fi
alias root='root -l'
alias groot='g++ `root-config --cflags --glibs` -lRooFit -lRooFitCore'

###### Variables and alias
lxplus() {
    nodeId=$1
    case ${nodeId} in
        ("tmux")
            ssh -YC $(tail -n 1 ~/lxplus.log) -t '/afs/cern.ch/user/p/pchen/local/usr/bin/tmux -CC a'
        ;;
        ("random")
            ssh -YC ${USER}@lxplus.cern.ch
        ;;
        ("el6")
            ssh -YC ${USER}@lxplus6.cern.ch
        ;;
        ("pyu")
            ssh -YC pyu@lxplus.cern.ch
        ;;
        (*)
            ssh -YC ${USER}@lxplus${nodeId}.cern.ch
        ;;
    esac
}

_lxplus() {
    # For more example: https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org

    #compadd tmux pyu random el6
    _describe 'command' "('tmux: Attach a tmux session.', 'random: A random machine', 'el6: A random SLC6 machine')"
}

compdef _lxplus lxplus

ntugrid5() {
    user=$1
    if [[ ${user} = 'pyu' ]]; then
        ssh -YC pyu@140.112.104.121
    else
        ssh -YC pchen@140.112.104.121
    fi
}
alias hep1='ssh -YC phchen@hep1.phys.ntu.edu.tw'

###### zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

###### Some useful command
alias weather='curl http://v2.wttr.in/'
alias ptt2='ssh bbsu@ptt2.cc'

###### remove duplicated path
export PATH=$(echo -n ${PATH} | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
export LIBPATH=$(echo -n ${LIBPATH} | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
export SHLIB_PATH=$(echo -n ${SHLIB_PATH} | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
export PYTHONPATH=$(echo -n ${PYTHONPATH} | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
export MANPATH=$(echo -n ${MANPATH} | awk -v RS=: '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
