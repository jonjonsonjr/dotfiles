# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lf='ls -FlAh'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# Change BASH prompt
LAST=$(pwd)
info_flag=1;

source /etc/bash_completion.d/git-prompt.sh

set_prompt(){
  if [ $? = 0 ]; then
    echo
    info_flag=1
  fi
  PS1=""
  if [ "$LAST" != "$( pwd )" ] || [ $info_flag -eq 1 ]; then
    PS1+="$txtcyn\u@\h:$txtgrn\w$txtred\$(__git_ps1)$txtrst\n"
    info_flag=0
  fi
  PS1+="$bldblkλ$txtrst "
  LAST=$( pwd )
}

PROMPT_COMMAND='set_prompt'

#Custom clear for top bar prompt
alias clear='clear;info_flag=1'

# added by Anaconda 2.2.0 installer
export PATH="/home/rabi/anaconda/bin:$PATH"
