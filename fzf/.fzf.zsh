# Setup fzf
# ---------
# if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
# fi

# Auto-completion
# ---------------
# [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
# [[ $- == *i* ]] && source "/opt/homebrew/Cellar/fzf/0.38.0/shell/completion.zsh" 2> /dev/null
if [[ $- == *i* ]]; then
  fzf_path="$(brew --prefix fzf)/shell/completion.zsh"
  [[ -f "$fzf_path" ]] && source "$fzf_path"
fi

# Key bindings
# ------------
# source "/usr/local/opt/fzf/shell/key-bindings.zsh"
# source "/opt/homebrew/Cellar/fzf/0.50.0/shell/key-bindings.zsh"
key_bindings_path="$(brew --prefix fzf)/shell/key-bindings.zsh"
[[ -f "$key_bindings_path" ]] && source "$key_bindings_path"
