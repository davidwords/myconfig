# Source global definitions
if [ -f /etc/bashrc ] ; then
	. /etc/bashrc
fi

# set default file permisions to u=rw,g=r,o=
umask 027

## user-specific aliases {{{
##
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias gb='cd -'
alias page='less -XMMJw -z-2'
alias ls='ls -F --color=never'
#alias vi='vim --servername VIM'
alias vis='sudo vim'
alias free='free -m'
alias igrep='grep -i'
alias gterm='gnome-terminal --geometry=89x32+383+302'
alias j='jobs'
alias iocate='locate -i'
alias xcompmgr='xcompmgr -Cc'
alias config='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
# }}}

[[ -f "/home/dle/.config/autopackage/paths-bash" ]] && . "/home/dle/.config/autopackage/paths-bash"


## user-specific environment variables {{{
##
#export MANPAGER="col -b | vim -R -c 'set ft=man nomod nolist' -"
export HISTCONTROL=ignoredups
export VISUAL=vim
export EDITOR="$VISUAL"

# Make a PS1 prompt like:
#  +-------------------+
#  |dle@bigstory:~     |
#  |                   |
#  |                   |
#  |                   |
#  |$                  |
#  +-------------------+
export PS1="\[\e[1m\]\u@\h:\w\n\n\n\n\$ \[\e[0m\]"

export TERM=xterm-color
#PS1="[\h \@]\n[\u@\W]\$ " # a standard PS1 prompt
export PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME}:${PWD}\007"'
export DOCROOT='/var/www'
export DESKTOP=$HOME/Desktop
export HISTSIZE=2000
export HISTFILESIZE=2000
export PYTHONSTARTUP=$HOME/.pythonrc
export ARTISTIC_STYLE_OPTIONS='--style=1tbs -y -J'
# }}}

## User-specific functions {{{
##

lst()
{
    ls -t ${1:-.} | less;
}

psx()
{
    ps ax | grep -i "$1" | grep -v grep;
}

#tear()
#{
#    if [ "$1" = `echo -b` ];
#    then
#        bzcat "$2" 2>/dev/null | tar -tf - 2>/dev/null
#    elif [ ! "$1" ]
#    then
#        echo 'Usage: "tear somefile.tar.gz"  OR "tear somefile.tgz" OR
#        "tear -b somefile.tar.bz2"' >&2
#    else
#        zcat "$1" 2>/dev/null | tar -tf - 2>/dev/null
#    fi
#}
# }}}

## Need for a xterm & co if we don't make a -ls {{{
##
[ -n "$DISPLAY" ] && {
	[ -f /etc/profile.d/color_ls.sh ] && source /etc/profile.d/color_ls.sh
	 export XAUTHORITY=$HOME/.Xauthority
}
# }}}

# Read first /etc/inputrc if the variable is not defined,
# and after the /etc/inputrc include the ~/.inputrc
[ -z $INPUTRC ] && export INPUTRC=/etc/inputrc


# START bash completion -- do not remove this line {{{
# Source /etc/bash_completion
#bash=${BASH_VERSION%.*}; bmajor=${bash%.*}; bminor=${bash#*.}
#if [ "$PS1" ] && [ $bmajor '>' 2 ] && [ $bminor '>' 04 ] \
#   && [ -f /etc/bash_completion ]; then # interactive shell
#        # Source completion code
#        . /etc/bash_completion
#fi
#unset bash bmajor bminor
# END bash completion -- do not remove this line
if [ -f /etc/bash_completion ] ; then
    . /etc/bash_completion
fi
# }}}

# vim: fen: fdm=marker:

