#!/usr/bin/env bash

TITLE="Application launcher"
SCREEN_WIDTH=`yabai -m query --displays --display | jq .frame.w*2`
SCREEN_HEIGHT=`yabai -m query --displays --display | jq .frame.h*2`

TERM_WIDTH=1280
TERM_HEIGHT=1260

let "X=SCREEN_WIDTH/2-TERM_WIDTH/2"
let "Y=SCREEN_HEIGHT/2-TERM_HEIGHT/2"

# /Applications/Alacritty.app/Contents/MacOS/alacritty -t "${TITLE}" -o window.position.x="${X}" -o window.position.y="${Y}" -o window.dimensions.lines=35 -o window.dimensions.columns=80 -o window.decorations=none --working-directory "$(pwd)" -e "$1"

# /Applications/kitty.app/Contents/MacOS/kitty --single-instance --instance-group --title="${TITLE}" --working-directory="$(pwd)" -o font_family="Menlo"  "$1"

/Applications/kitty.app/Contents/MacOS/kitty --single-instance --instance-group=1 --title="${TITLE}" -c="/Users/nbl7/repos/config/kitty/kitty_launcher.conf" ~/repos/config/scripts/app_launcher.sh
