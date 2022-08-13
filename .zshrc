
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
precmd() { 
	echo -en "\033]0;${PWD/#$HOME/~}\007"
}

#### Set prompt text
#export PROMPT="%~$ "

#### Set prompt text
setopt PROMPT_SUBST
# PROMPT='%F{green}%D{%a.%d %H:%M:%S}%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
PROMPT='%F{green}%D{T%H:%M:%S}%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '

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

#### Set location for autocomplete cache files
ZSH_COMPDUMP=~/.cache/zsh/zcompdump

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc'; fi

### Loading .profile
if [ -f ~/repos/config/.profile ]; then
	. ~/repos/config/.profile
fi

