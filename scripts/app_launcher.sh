#!/usr/bin/env bash

find /System/Library/CoreServices /System/Applications /Applications /System/Applications/Utilities ~/Applications/Chrome\ Canary\ Apps.localized -maxdepth 1 -name "*.app" | fzf | xargs -I {} open "{}"
kill -9 $PPID                        # this will kill the old terminal
exit                                 # exit script
