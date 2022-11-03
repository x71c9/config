### Get video duration

```
ffprobe -i video/video.mp4 -show_entries format=duration -v quiet -of csv="p=0"
```
