#### Remove First character in terminal Hyper `%`
unsetopt PROMPT_SP

#### Set aliases
## List hidden ordered human size
alias ll='ls -aohG'

#### NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/nbl7/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/nbl7/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/nbl7/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/nbl7/google-cloud-sdk/completion.zsh.inc'; fi

# This enable autocomplete ignoring capitalization
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

#### Set prompt text
export PROMPT="%~$ "
