#!/bin/bash

# This is the directory containing the current file script
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

# This is the directory from which the script is called
PWD=$(pwd)

# "${1#/}" This removes "/" if is first char
# ${variable#glob}
# where
# 	variable is any bash variable
# 	glob is any glob pattern (subject to pathname expansion) to match against)
# 	# delete the shortest match starting at the beginning of the line
# 	## delete the longest match starting at the beginning of the line
# 	% delete the shortest match starting at the end of the line
# 	%% delete the longest match starting at the end of the line

if [ "$1" != "${1#/}" ]; then # The first argument is an absolute path
	DIR=$1
else # The first argument is a relative path
	DIR=$PWD/$1
fi

for f in "$DIR/"*.mkv;
do
	echo -------------------- $f
	ffmpeg -i "${f}" -c:v libx264 -c:a copy -c:s mov_text "${f%.*}".mp4
done
