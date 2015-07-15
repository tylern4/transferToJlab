#Prompt configuration:
#You can use the PS1 PS2 PS3 PS4 variables to configure the prompt;
#see man bash for more details; search for PROMPT

#PS1='[\u@\h \W]\$ ' #standard Arch Linux prompt
#PS1='\s-\v\$ ' #just shell name and version
#PS1='[\s-\@]$ ' #shell name and current time
#PS1='[\T]$ ' #time in 12-hour HH:MM:SS
#PS1='[\t]$ ' #time in 24-hour HH:MM:SS
#PS1='[\W]$ ' #basename of current directory; $HOME abbreviated to ~
#PS1='[\u@\h]<$(date +%r)>{\W}\n$ '
#PS1='[\u@\h $(date +%r)]$ '
PS1='jlab> '
#
#Here's a prompt for root, it has a red # symbol to alert you
#that you are running as root:
#PS1='\[\e[0;31m\]#\[\e[0m\] ' #this is root's .bashrc
#
#programmable completion:
# complete -cf sudo #not needed if bash-completion installed
# complete -cf man #not needed if bash-completion installed
# complete -d cd
#status:
#export CLAS_PARMS=/group/clas/parms;
export CLAS_ROOT=/group/clas
#source /group/clas/builds/test3/environment.sh
#source /group/clas/builds/64bit/environment64.sh
source /group/clas/builds/environment.sh
#source /group/clas/env.sh
alias s='echo $(whoami)@$(hostname) && pwd && date +%F && date +%r'
#ls alias for speed and health of wrists:
alias t='ls --color=auto -F'
#lscount alias:
alias i='lscount'
#cd alias:
alias c='cd'
complete -d c
#CVS repos:
alias cvs-ls='cvs co -c'
alias ej0='eject -T /dev/sr0'
alias ej='ej0'
alias burn='wodim -audio -dao -pad dev=/dev/sr0'
alias blank='wodim blank=fast dev='
alias e='emacs -nw'
alias em='emacs --no-splash' #disables the annoying 2 window opening for
#a single file
alias g='grep --color'
alias gi='grep --color -i'
#set up default text file editor on command line:
export EDITOR='emacs -nw'
#take notes alias:
alias takenotes='emacs -nw --no-splash $(date +%F).txt'
#show all processes:
alias pse='ps -e'
#show all processes from a user:
alias psu='ps -U'
#scan2jpeg: scan to a jpeg file:
alias scan2jpeg='scanimage --format pnm --resolution 275 | cjpeg -quality 80 >'
#the previous is only meaningful if a scanner is attached (I think)
#alias for pcmanfm (PCManFM file manager):
alias fm='pcmanfm'
#ssh aliases:
alias sshlaptop='ssh -p1989 ghollisjr-laptop'
alias sshdyndnsdesktop='ssh -p1989 ghollisjr@ghollisjr.dyndns-wiki.com'
alias sshlocaldesktop='ssh -p1989 ghollisjr-desktop'
alias sshfsdyndns='sshfs -p 1989 -o idmap=user ghollisjr.dyndns-wiki.com:. /mnt/GHDesktop'
alias sshphysics='ssh ghollisjr@129.252.38.42'
#netcfg alias:
alias nc='netcfg current'
#ACPI alias:
alias a='acpi -V'
#mupen64plus alias
#alias mupen='mupen64plus --resolution 1024x768 --datadir $HOME/.mupen64plus'
alias mupen='mupen64plus --resolution 1920x1080 --datadir $HOME/.mupen64plus'
#Shutdown and Reboot aliases:
alias sd='sudo shutdown -hP now'
alias rb='sudo shutdown -r now'
#pushd and popd aliases:
alias p='pushd'
alias o='popd'
#to play starcraft:
alias sc='wine /home/ghollisjr/ISOs/StarCraft/combined_disc_contents/StarCraft\ \(Windows\).exe'
#switch keyboard layout aliases:
alias sg='setupghollisjr.sh'
alias sq='setupqwerty.sh'
#CMake alias:
alias cm='cmake CMakeLists.txt'
#Maxima alias:
alias max='maxima --userdir=$HOME/Scripts/maxima_scripts'
#SBCL alias:
alias sbcl='~/phdanalysis/work/sbcl/run-sbcl.sh'
#
#function to see if a value is in a variable:
function search_var
{
    if [[ $# != 2 ]] ; then
	echo "Usage: search_var <value> <var>";
    else
	local TMPIFS=$IFS;
	IFS=':';
	eval local value=\$$2;
	local isin=false;
	for i in $value; do
	    if [[ $i == $1 ]] ; then
		isin=true;
	    fi;
	done;
	if [[ $isin == true ]] ; then
	    echo "yes";
	else
	    echo "no";
	fi;
    fi;
    IFS=$TMPIFS;
}
#
#useful function for adding a value to a variable:
function add2var
{
    # $1=value to be added
    # $2=variable to add value to
    local value=$1;
    if [[ $(search_var $1 $2) == "no" ]] ; then
	if [[ $(eval echo "\$$2") == '' ]] ; then
	    local tmpstring="export $2=$1"
	    eval $tmpstring;
	else
	    local tmpstring="export $2=\$$2:$1"
	    eval $tmpstring
	fi;
    fi;
}
function add2varfront
{
    # $1=value to be added
    # $2=variable to add value to
    local value=$1;
    if [[ $(search_var $1 $2) == "no" ]] ; then
	if [[ $(eval echo "\$$2") == '' ]] ; then
	    local tmpstring="export $2=$1"
	    eval $tmpstring;
	else
	    local tmpstring="export $2=$1:\$$2"
	    eval $tmpstring
	fi;
    fi;
}
#
#setup JLAB settings:
export MYSQL_INCLUDE='/usr/include/mysql/'
export MYSQL_LIB='/usr/lib/mysql'
export CVSROOT='/group/clas/clas_cvs/'
export CVS_RSH='ssh'
#setup $HOME/bin
add2var $HOME/bin PATH;
add2varfront $HOME/phdanalysis/work/git/bin PATH;
add2var $HOME/bin/Linux64RHEL5 PATH;
#
#setup include path:
add2var $HOME/include CPATH;
#
#setup LD_LIBRARY_PATH
add2var $HOME/lib LD_LIBRARY_PATH;
add2varfront $HOME/phdanalysis/work/git/lib64 LD_LIBRARY_PATH;
#
#setup LIBRARY_PATH
add2var $HOME/lib LIBRARY_PATH;
#
#setup /usr/local/lib and /usr/local/bin
#add2var /usr/local/lib LD_LIBRARY_PATH
add2var /usr/local/bin PATH
#set up ROOT:
#source /work/clas/clase1-6/ghollis/root/bin/thisroot.sh
export ROOTSYS=/apps/root/5.30.00/root
export ROOTLIB=$ROOTSYS/lib
source $ROOTSYS/bin/thisroot.sh
#export ROOTSYS=$HOME/src/root
#add2varfront $ROOTSYS/bin PATH;
#add2varfront $ROOTSYS/lib LD_LIBRARY_PATH;
#my personal run function:
function run
{
    if [[ $# -le 0 ]] ; then
	echo "Usage: run <program>"
	return 1;
    fi;
    nohup $@ > /dev/null &
    return;
}
complete -cf run
#custom tar command to make it simpler
function mytar
{
    if [[ $# -ne 1 ]] ; then
	echo "Usage: mytar <directory>";
    else
	tar cjf $(dirname $1)/$(basename $1 '/').tar.bz2 $1;
    fi;
}
#custom zip command to make it simpler
function myzip
{
    if [[ $# -ne 1 ]] ; then
	echo "Usage: myzip <directory>";
	exit;
    fi;
    zip -r $(dirname $1)/$(basename $1 '/').zip $1;
}
#function to grab a single line from a file
function getline
{
    if [[ $# < 1 || $# > 2 ]] ; then
	echo "Usage: getline <line> [file]";
    elif [[ $# == 2 ]] ; then
	gawk "{if(NR==$1) {print \$0; exit;}}" < $2;
    else
	gawk "{if(NR==$1) {print \$0; exit;}}";
    fi;
}
#function to grab a range of lines from a file
function getlines
{
    if [[ $# < 2 || $# > 3 ]] ; then
	echo "Usage: getlines <start line> <end line> [file]";
    elif [[ $# == 3 ]] ; then
	gawk "{if(NR>=$1 && NR<=$2) {print \$0;} else if(NR>$2) exit;}" < $3;
    else
	gawk "{if(NR>=$1 && NR<=$2) {print \$0;} else if(NR>$2) exit;}";
    fi;
}
#function to print value of $1
function evaluate_variable
{
    #$1==variable name to evaluate
    eval "echo \$$1";
}
#function to remove a value from a variable, similar to add2var
#
function removefromvar
{
    if [[ $# != 2 ]] ; then
	echo "Usage: removefromvar <value> <variable>";
    else
	if [[ $(search_var $1 $2) == "yes" ]] ; then
	    local TMPIFS="$IFS";
	    IFS=":";
	    eval local value=\$$2;
	    local i;
	    local return_val;
	    for i in $value; do
		if [[ "$i" != "$1" ]] ; then
		    return_val[${#return_val[@]}]=$i;
		fi;
	    done;
	    eval export $2=${return_val[0]};
	    for ((i=1;i<${#return_val[@]};i=i+1)); do
		eval export $2="\$$2:${return_val[$i]}";
	    done;
	fi;
	IFS=$TMPIFS;
    fi;
}
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
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'
#alias ls='ls --color=auto'
TERM=xterm

export E1EH10PREFIX=/mss/clas/e1e/production/pass1/h10
