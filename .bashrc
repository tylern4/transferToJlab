##
## exports prompt
export PS1="[\[$(tput sgr0)\]\[\033[38;5;33m\]\H\[$(tput sgr0)\]\[\033[38;5;15m\]:\[$(tput sgr0)\]\[\033[38;5;202m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]]\[$(tput sgr0)\]\[\033[38;5;40m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
#

#status:
#export CLAS_PARMS=/group/clas/parms;
export CLAS_ROOT=/group/clas
#source /group/clas/builds/test3/environment.sh
#source /group/clas/builds/64bit/environment64.sh
source /group/clas/builds/environment.sh
#source /group/clas/env.sh


#set up ROOT:
#source /work/clas/clase1-6/ghollis/root/bin/thisroot.sh
export ROOTSYS=/apps/root/5.34.21/root
export ROOTLIB=$ROOTSYS/lib
source $ROOTSYS/bin/thisroot.sh

#
#old stuff, probably from Ubuntu:
#
# # enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     #alias dir='dir --color=auto'
#     #alias vdir='vdir --color=auto'

#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# if [ -f ~/.bash_aliases ]; then
#     . ~/.bash_aliases
# fi

# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).
# if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#     . /etc/bash_completion
# fi
# some more ls aliases
alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
alias ls='ls --color=auto'

