# Setup fzf
# ---------
# if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
#   export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
# fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/share/fzf/completion.bash" 2> /dev/null
# [[ $- == *i* ]] && source "/opt/homebrew/Cellar/fzf/0.30.0/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/share/fzf/key-bindings.bash"
# source "/opt/homebrew/Cellar/fzf/0.30.0/shell/key-bindings.bash
