### .bash_profile (this file) is loaded in interactive login shell

### Loading .bashrc
### .bashrc is loaded in non-interactive sheel, like scripts, crontab, etc.
### This should be linked to ~/repos/config/bash/.bashrc
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

### Loading custom .bash_profile commamnds
if [ -f ~/repos/config/bash/.bash_profile.custom ]; then
	. ~/repos/config/bash/.bash_profile.custom
fi

### The following is usually added by third party software
### ------------------------------------------------------

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
