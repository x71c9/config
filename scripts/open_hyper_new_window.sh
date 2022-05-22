#!/usr/bin/env bash

/usr/bin/osascript <<EOD
	tell app "System Events"
		tell process "Hyper"
			set frontmost to true
			click menu item "New Window" of menu "Shell" of menu bar 1
		end tell
	end tell
EOD
