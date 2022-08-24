
### Loading custom .zshrc
if [ -f ~/repos/config/zsh/.zshrc.custom ]; then
	. ~/repos/config/zsh/.zshrc.custom
fi

### The following is usually added by third party software

#### FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/x71c9/installs/google-cloud-sdk/completion.zsh.inc'; fi

# pnpm
export PNPM_HOME="/Users/x71c9/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
