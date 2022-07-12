#### Setting locale
# LANG=en_US.UTF-8
# LC_CTYPE=en_US.UTF-8
# LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

### Remove First character in terminal Hyper `%`
unsetopt PROMPT_SP

#### Set Version Control System in prompt
autoload -Uz vcs_info
precmd() { vcs_info }

#### Add git branch to prompt
zstyle ':vcs_info:git:*' formats '%b '

#### Set prompt text
#export PROMPT="%~$ "

#### Set env var EDITOR
export EDITOR=vim

#### Set prompt text
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

#### Set aliases

## Python as python3
alias python='python3'

## List hidden ordered human size
alias ll='ls -aohG'

## Unlock pass
alias passp='pass -c crypt/a'

## Go to NOTES
alias note='cd ~/repos/notes && ll'

## Go to Ubersicht widget folder
alias cdubersicht='cd ~/Library/Application\ Support/Übersicht/widgets'

## Alias go to
alias gr='cd ~/repos'
alias gc='cd ~/repos/config'
alias gu='cd ~/repos/uranio'

## Open link in Brave - Run `brave google.com`
function brave() {
	if [[ $1 == http* || -d $1 || -f $1 ]] then
		URL=$1
	else
		URL="https://$1"
	fi
	open -a /Applications/Brave\ Browser.app $URL
}

## Open link in Chrome - Run `chrome google.com`
function chrome() {
	if [[ $1 == http* || -d $1 || -f $1 ]] then
		URL=$1
	else
		URL="https://$1"
	fi
	open -a /Applications/Google\ Chrome.app $URL
}
#### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# This will allow autocomplete for pass with tab
# ZSH has autocomplete functions in $FPATH or $fpath
# This line will add the folder with _pass autocomplete function
# Name of the file must be _pass
# This must be defined before autoload `compinit` (maybe)
fpath=(~/repos/config/pass $fpath)

# This enable autocomplete ignoring capitalization
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Alias for NCDU
alias ncdu='ncdu --color dark'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc'; fi

# Add Yarn binaries to PATH
export PATH="$(yarn global bin):$PATH"
