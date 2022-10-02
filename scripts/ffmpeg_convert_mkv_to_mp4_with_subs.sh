#!/bin/bash
for f in ./*.mkv;
do
	ffmpeg -i "${f}" -c copy -c:s mov_text "${f%.*}".mp4
done
