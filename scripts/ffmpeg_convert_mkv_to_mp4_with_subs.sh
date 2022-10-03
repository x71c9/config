#!/bin/bash

DIR=$1
for f in $DIR/*.mkv;
do
	ffmpeg -i "${f}" -c:v mpeg4 -c:a copy -c:s mov_text "${f%.*}".mp4
done
