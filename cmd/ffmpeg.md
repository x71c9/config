### Get video duration

```
ffprobe -i video/video.mp4 -show_entries format=duration -v quiet -of csv="p=0"
```

### FFMPEG commands

#### Map syntax

```
[0:v:0]
 | | |
 | | L first track
 | L _ video track
 L _ _ first input

--> this select the first video track from the first input
```

```
[2:a:4]
 | | |
 | | L fifth track
 | L _ audio track
 L _ _ thrid input

--> this select the fifth audio track from the third input
```

#### Mix 2 audio file in one track

- Force verwrite output
	- `-y`
- Half volume `bg.mp3`, alias `[h]`
	- `-filter_complex "[2:a:0] volume=.5 [h]"`
- Mix voice.mp3 with `[h]`, alias `[a]`
	- `-filter_complex "[1:a:0] [h] amix=input=2 [a]"`
- Map video's track 0 as first track
	- `-map 0:v:0`
- Map `[a]` as second track
	- `-map "[a]"`
- Copy coded from video
	- `-c:v copy`
- Set coded audio `aac`
	- `-c:a aac`
- Set bitrate audio to `192k`
	- `-b:a 192k`
- Output file `output.mp4`
	- `output.mp4`

```
ffmpeg \
	-y \
	-i video.mp4 \
	-i voice.mp3 \
	-i bg.mp3 \
	
	-filter_complex "[2:a:0] volume=.5 [h] ; [1:a:0] [h] amix=inputs=2 [a]" \
	
	-map 0:v:0 \
	-map "[a]" \
	
	-c:v copy \
	-c:a aac \
	-b:a 192k \
	
	output.mp4
```

#### Mix 2 audio, the second with certain delay

```
ffmpeg \
	-y \
	-i video.mp4 \
	-i voice.mp3 \
	-i bg.mp3 \
	
	-filter_complex "[2:a:0]adelay=2790|2790[delayed];[1:a:0][delayed]amix=inputs=2[mixed]" \
	
	-map 0:v:0 \
	-map "[mixed]" \
	
	-c:v copy \
	-c:a aac \
	-b:a 192k \
	
	output_with_delay.mp4
```

#### Mix audio with chorus

```
ffmpeg \
	-y \
	-i video.mp4 \
	-i voice.mp3 \
	
	-filter_complex "[1:a:0]chorus=0.5:0.9:50|60|40:0.4|0.32|0.3:0.25|0.4|0.3:2|2.3|1.3[c]" \
	
	-map 0:v:0 \
	-map "[c]" \
	
	-c:v copy \
	-c:a aac \
	-b:a 192k \
	
	output_with_chorus.mp4
```

#### Mix audio with vibrato

```
ffmpeg \
	-y \
	-i video.mp4 \
	-i voice.mp3 \
	
	-filter_complex "[1:a:0]vibrato=f=40[c]" \
	
	-map 0:v:0 \
	-map "[c]" \
	
	-c:v copy \
	-c:a aac \
	-b:a 192k \
	
	output_with_chorus.mp4
```
#### Infos

https://ffmpeg.org/ffmpeg-filters.html

https://www.vacing.com/ffmpeg_audio_filters/index.html
https://dev.to/video/working-with-audio-in-ffmpeg-4631

https://superuser.com/questions/277642/how-to-merge-audio-and-video-file-in-ffmpeg
https://superuser.com/questions/590201/add-audio-to-video-using-ffmpeg
https://www.youtube.com/watch?v=lE1y_TTISTQ

There are two filter for mixing tracks: `amix` and `amerge`

### Generate FFMPEG showwavespic

<!-- https://trac.ffmpeg.org/wiki/Waveform -->
<!-- https://ffmpeg.org/ffmpeg-filters.html#showwavespic -->

```
ffmpeg -i __full__.mp3 -filter_complex "showwavespic=s=1920x1080:colors=0xFFFFFF" -frames:v 1 showwavespic_00.png
ffmpeg -i __full__.mp3 -filter_complex "showwavespic=s=1080x218:scale=log:colors=0xFFFFFF" -frames:v 1 showwavespic_A01.png
```

### Generate a video with the waveform of an audio
<!-- http://underpop.online.fr/f/ffmpeg/help/showwaves.htm.gz -->

```
ffmpeg -i __full__.mp3 -filter_complex "[0:a]showwaves=s=1920x1080:colors=0xFFFFFF:mode=line,format=yuv420p[v]" -map "[v]" -map 0:a -c:v libx264 -c:a copy output_00.mp4
```
Possible mode:
```
mode=point
mode=line
mode=p2p
mode=cline
```

### Invert image colors with FFMPEG

```
ffmpeg -i image.png -vf negate output_file.png
```

