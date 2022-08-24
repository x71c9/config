### .bashrc (this file) is loaded in non-interactive shell, like scripts,
### crontab, etc.

### Loading custom .bash_profile commamnds
if [ -f ~/repos/config/bash/.bashrc.custom ]; then
	. ~/repos/config/bash/.bashrc.custom
fi

### The following is usually added by third party software
### ------------------------------------------------------

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

