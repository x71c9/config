######
## https://tmuxcheatsheet.com/
##
## List of commands
##
## exit -> exit and close the session
## tmux new -s [session-name]
##
## Ctrl+b d Detach from the session
## tmux attach-session -t [session-name]
## tmux attach -t [session-name]
##
## tmux ls -> list all tmux sessions
## tmux kill-server -> kill all sessions
## tmux kill-session -t [session-name]
##
## Ctrl+b : Open Tmux console, like VIM
## Ctrl+b ? Help
## Ctrl+b s List session
## Ctrl+b $ Rename the current session
##
## Ctrl+b c Create a new window (with shell)
## Ctrl+b w Choose window from a list
## Ctrl+b 0 Switch to window 0 (by number)
## Ctrl+b , Rename the current window
## Ctrl+b n Change to next window
## Ctrl+b p Change to the previous window
##
## Ctrl+b % Split current pane horizontally into two panes
## Ctrl+b " Split current pane vertically into two panes
## Ctrl+b o Go to the next pane
## Ctrl+b ; Toggle between the current and previous pane
## Ctrl+b x Close the current pane
## Ctrl+b hjkl Move to pane left down top right
## Ctrl+b }{ Swap with next/previous pane
##
## Command in Tmux console
##
## :resize-pane -L [num] -> resize pane to left of [num] chars
## :resize-pane -LURD -> LeftUpRightDown
#####

####
# Copy Tmux buffer clipboard to system clipboard (Ubuntu)
# You need to install XCLIP before
# sudo apt-get install --assume-yes xclip
#
# To enter copy mode in Tmux:
# - Ctrl+b Ctrl+[
# - Move as in VIM
# - Enter Visual Mode and select the text
# - Push y
# or just drag the text with the mouse and push y
#
bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel 'xclip -in -selection clipboard'


