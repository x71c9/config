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
