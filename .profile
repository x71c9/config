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

#### Add title to TABs
# title() { echo -ne "\e]0;$1\a"; }
# precmd() { echo -en "\e]0;$1\a" }
precmd() { echo -en "\033]0;${PWD/#$HOME/~}\007" }

#### Set prompt text
#export PROMPT="%~$ "

#### Set env var EDITOR
export EDITOR=vim

#### Set prompt text
setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

#### Set aliases

## List hidden ordered human size
alias ll='ls -aohG'

## Move to trash
alias trash='move_to_trash'

## Python as python3
alias python='python3'

## Go to NOTES
alias note='cd ~/repos/notes && ll'

## Alias go to
alias gr='cd ~/repos'
alias gc='cd ~/repos/config'
alias gu='cd ~/repos/uranio'

## Alias open websites
alias og='firefox github.com/x71c9'

## Alias open websites
alias om='firefox mail.proton.me'

## Run script show_plist
alias show_plist='sh ~/repos/config/scripts/show_plists.sh';

## Default ctags not working on Mac
## Install via homebrew `brew install ctags` then use this alias
alias ctags="`brew --prefix`/bin/ctags"

## Unlock pass
alias passp='pass -c crypt/a'

## Go to Ubersicht widget folder
alias cdubersicht='cd ~/Library/Application\ Support/Übersicht/widgets'

# Alias for NCDU
alias ncdu='ncdu --color off'

## Move to Trash directory
move_to_trash () {
	mv "$@" ~/.Trash
}

## Open link in Firefox - Run `firefox google.com`
function firefox() {
	if [[ $1 == http* || -d $1 || -f $1 ]] then
		URL=$1
	else
		URL="https://$1"
	fi
	open -a /Applications/Firefox.app $URL
}

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

#### HISTORY VARIABLES
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
# setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
# setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

#### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#### Autocomplete
# More info here: https://github.com/zsh-users/zsh-completions/blob/master/zsh-completions-howto.org
#
# This will allow autocomplete for pass with tab
# ZSH has autocomplete functions in $FPATH or $fpath
# This line will add the folder with _pass autocomplete function
# Name of the file must be _pass
# This must be defined before autoload `compinit` (maybe)
fpath=(~/repos/config/pass $fpath)
fpath=(~/repos/config/docker $fpath)

# This enable autocomplete ignoring capitalization
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc'; fi

# Add Yarn binaries to PATH
export PATH="$(yarn global bin):$PATH"

