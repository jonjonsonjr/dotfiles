# Add vim 7.4, ffmpeg, and annaconda to path
export PATH="/u/css/comptonrj/vim74/src:u/css/comptonrj/ffmpeg/:/u/css/comptonrj/anaconda/bin:$PATH"
# Update VIMRUNTIME to local vim74 version
export VIMRUNTIME="/u/css/comptonrj/vim74/runtime"

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
ABSPATH="$(hostname -d)$(pwd)"
LENGTH=${#ABSPATH}
info_flag=1;

set_prompt(){
  if [ $? = 0 ]; then
    #PS1+="\n"
    echo
    info_flag=1
  fi
  #Save cursor position
  PS1="\["
  PS1+="\033[s"
  #Move to old location
  PS1+="\033[1;1f"
  #Clear to end of line
  PS1+="\033[K"
  PS1+="$txtcyn\s \V |$txtgrn \u"
  #Recalculate path and set position
  ABSPATH="$(hostname -d)$(pwd)"
  LENGTH=${#ABSPATH}
  PS1+="\033[1;\$((COLUMNS-LENGTH-7))f"
  PS1+="$txtcyn\$(hostname -d)$txtgrn\$( pwd ) $txtcyn|$txtcyn \A$txtrst"
  #Restore cursor position
  PS1+="\033[u"
  #Below to actualy prmopt
  if [ "$LAST" != "$( pwd )" ] || [ $info_flag -eq 1 ]; then
    PS1+="$txtcyn\u@\h:$txtgrn\w\n"
    info_flag=0
  fi
  PS1+=""
  PS1+="$bldblkλ$txtrst "
  LAST=$( pwd )
}

PROMPT_COMMAND='set_prompt'

#Custom clear for top bar prompt
a clear='clear;info_flag=1'

#Clear to let format take affect
clear
