# Aliases
alias a='alias'

# Navication
a up='cd ..'
a ..='cd ..'
a ...='cd ../../..'
a ....='cd ../../../..'
a .....='cd ../../../../..'
a .2='cd ../..'
a .3='cd ../../..'
a .4='cd ../../../..'
a .5='cd ../../../../..'
a back='cd $OLDPWD'

# Personal Navigation
a dls='cd ~/Downloads'
a desk='cd ~/Desktop'
a local='cd ~/local'
a bin='cd ~/bin'

# Shorthand Linux Tools
a h='history'
a j='jobs -l'
a c='clear'
a qq='exit'
a mv='mv -i'
a cp='cp -i'
a ln='ln -i'
a rm='rm -I --preserve-root'

# Root stuff
a chown='chown --preserve-root'
a chmod='chmod --preserve-root'
a chgrp='chgrp --preserve-root'

# Date and Time
a now='date +"%T"'
a nowtime='now'
a nowdate='date +"%d-%m-%Y"'

# Editor
a edit='vim'
a vim='nvim'
a svim='sudo vim'
a vi='vim'
a svi='sudo vim'
a vis='vim -S'
a vir='vim -S .session.vim'

# Non-standard Tools
a wget='wget -c'
a ff='firefox'
a browser='ff'

# Arch
a pacman='sudo pacman'
a update='pacman -Syu'
