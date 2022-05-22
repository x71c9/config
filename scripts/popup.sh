#!/usr/bin/env bash

TITLE="Application launcher"
SCREEN_WIDTH=`yabai -m query --displays --display | jq .frame.w*2`
SCREEN_HEIGHT=`yabai -m query --displays --display | jq .frame.h*2`

TERM_WIDTH=1280
TERM_HEIGHT=1260

let "X=SCREEN_WIDTH/2-TERM_WIDTH/2"
let "Y=SCREEN_HEIGHT/2-TERM_HEIGHT/2"

# /Applications/Alacritty.app/Contents/MacOS/alacritty -t "${TITLE}" -o window.position.x="${X}" -o window.position.y="${Y}" -o window.dimensions.lines=35 -o window.dimensions.columns=80 -o window.decorations=none --working-directory "$(pwd)" -e "$1"

# /Applications/kitty.app/Contents/MacOS/kitty --single-instance -d -T "${TITLE}" --working-directory "$(pwd)" -e "$1"

/Applications/kitty.app/Contents/MacOS/kitty --single-instance -T "${TITLE}" --working-directory "$(pwd)" "$1"

# /System/Applications/Utilities/Terminal.app/Contents/MacOS/Terminal --single-instance -T "${TITLE}" --working-directory "$(pwd)" "$1"
