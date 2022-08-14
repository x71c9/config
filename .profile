#### Setting locale
# LANG=en_US.UTF-8
# LC_CTYPE=en_US.UTF-8
# LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#### Set env var EDITOR
export EDITOR=vim

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
alias guc='cd ~/repos/uranio/urn-core'
alias gua='cd ~/repos/uranio/urn-api'
alias gut='cd ~/repos/uranio/urn-trx'
alias gud='cd ~/repos/uranio/urn-adm'
alias gub='cd ~/repos/uranio/urn-bld'
alias gul='cd ~/repos/uranio/urn-cli'

## Alias open websites
alias og='firefox github.com/x71c9'

## Alias open websites
alias on='firefox npmjs.com/~x71c9'

## Alias open websites
alias om='firefox mail.proton.me'

## Run script show_plist
alias show_plist='sh ~/repos/config/scripts/show_plists.sh';

## Default ctags not working on Mac
## Install via homebrew `brew install ctags` then use this alias

# $OSTYPE == darwin* --> it means it is MacOS
if [[ $OSTYPE == darwin* ]]; then
alias ctags="`brew --prefix`/bin/ctags"
fi

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
	if [[ $1 == http* || -d $1 || -f $1 ]];
	then
		URL=$1
	else
		URL="https://$1"
	fi
	open -a /Applications/Firefox.app $URL
}

## Open link in Brave - Run `brave google.com`
function brave() {
	if [[ $1 == http* || -d $1 || -f $1 ]];
	then
		URL=$1
	else
		URL="https://$1"
	fi
	open -a /Applications/Brave\ Browser.app $URL
}

## Open link in Chrome - Run `chrome google.com`
function chrome() {
	if [[ $1 == http* || -d $1 || -f $1 ]];
	then
		URL=$1
	else
		URL="https://$1"
	fi
	open -a /Applications/Google\ Chrome.app $URL
}

# Add Yarn binaries to PATH
# export PATH="$(yarn global bin):$PATH"
export PATH="~/.yarn/bin/:$PATH"

#### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

