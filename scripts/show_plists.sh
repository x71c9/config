#!/usr/bin/env bash

# This script list all the direcotories containing plist files.
# If a paramter is given is used as search term.
# grep -i -> case insensitive

TERM=$1

RED='\033[0;35m'
CYAN='\033[0;32m'
NC='\033[0m' # No Color

if ! [ -z "$1" ]; then
	echo '------------------------------------------------------------'
	echo $CYAN~/Library/LaunchAgents$NC
	RES="$(ls -aohG ~/Library/LaunchAgents | grep -i $TERM)"
	XRES="${RES%x}"
	echo "$RED$XRES$NC"
	echo '------------------------------------------------------------'
	echo $CYAN/Library/LaunchAgents$NC
	RES="$(ls -aohG /Library/LaunchAgents | grep -i $TERM)"
	XRES="${RES%x}"
	echo "$RED$XRES$NC"
	echo '------------------------------------------------------------'
	echo $CYAN/Library/LaunchDaemons$NC
	RES="$(ls -aohG /Library/LaunchDaemons | grep -i $TERM)"
	XRES="${RES%x}"
	echo "$RED$XRES$NC"
	echo '------------------------------------------------------------'
	echo $CYAN/System/Library/LaunchAgents$NC
	RES="$(ls -aohG /System/Library/LaunchAgents | grep -i $TERM)"
	XRES="${RES%x}"
	echo "$RED$XRES$NC"
	echo '------------------------------------------------------------'
	echo $CYAN/System/Library/LaunchDaemons$NC
	RES="$(ls -aohG /System/Library/LaunchDaemons | grep -i $TERM)"
	XRES="${RES%x}"
	echo "$RED$XRES$NC"
else
	echo '------------------------------------------------------------'
	echo $CYAN~/Library/LaunchAgents$NC
	ls -aohG ~/Library/LaunchAgents
	echo '------------------------------------------------------------'
	echo $CYAN/Library/LaunchAgents$NC
	ls -aohG /Library/LaunchAgents
	echo '------------------------------------------------------------'
	echo $CYAN/Library/LaunchDaemons$NC
	ls -aohG /Library/LaunchDaemons
	echo '------------------------------------------------------------'
	echo $CYAN/System/Library/LaunchAgents$NC
	ls -aohG /System/Library/LaunchAgents
	echo '------------------------------------------------------------'
	echo $CYAN/System/Library/LaunchDaemons$NC
	ls -aohG /System/Library/LaunchDaemons
fi

