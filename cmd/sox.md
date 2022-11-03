### SOX commands

https://opensource.com/article/20/2/linux-sox

Contatenate audio files:
```
sox file1.mp3 file2.mp3 joined.mp3
```
Convert mp3 to wav
```
sox file.mp3 file.wav
```
Mix 2 files
```
sox -m file1.mp3 fie2.wav mixed.mp3
```
Add silence, 1s in front, 4s at the end
```
play file.mp3 pad 1 4
```
Add reverb
```
sox file.mp3 reverb.mp3 pad 0 3 reverb
play voice.mp3 pad 0 4 reverb 80 100 50 100 40
```
Room reveber
```
play voice.mp3 pad 0 4 reverb 8 100 50 10 40
```
Only wet rever
```
sox file.mp3 reverb.mp3 pad 0 3 reverb -w
```
Add chorus
```
play voice.mp3 pad 0 3 chorus .6 .8 60 .34 .2 2 -t
```
Print spectogram
```
sox voice.mp3 -n spectrogram
```

Play sound
```
play -n synth 0.5 sine 200-500 synth 0.5 sine fmod 700-100
play -n synth 2 sine 200-500 synth 2 sine fmod 7-1
play −n synth 4 pluck %−29
```

Get raw data amplitude
```
sox voice.mp3 -t dat voice.dat
sox voice.mp3 -r 10 file.dat
```
`-t` filetype `dat`
`-r` sample rate

Get info
```
sox --info voice.mp3
```

Robotic voice
```
play voice.mp3 overdrive 10 echo 0.8 0.8 5 0.7 echo 0.8 0.7 6 0.7 echo 0.8 0.7 10 0.7 echo 0.8 0.7 12 0.7 echo 0.8 0.88 12 0.7 echo 0.8 0.88 30 0.7 echo 0.6 0.6 60 0.7
```

Bended voice
```
play slide-0.mp3 reverb 8 10 50 10 10 bend 0,180,.25 0,740,.53 0,-520,.3
```

Voices
```
play slide-0.mp3 bass 4 phaser 0.8 0.9 3 .5 2 -t reverb 8 10 50 10 10 pitch +200 bass 3
play slide-0.mp3 bass 4 phaser 0.8 0.9 3 .5 2 -t reverb 8 10 50 10 10 pitch -200 bass 3
```

### Generate SOX Spectrogram

Basic
```
sox __voice__.mp3 -n spectrogram -o spectrogram_00.png
```

Tricolor
```
sox __voice__.mp3 −n rate 6k -n spectrogram -h -m -p 3 -z 85 -y 768 -o spectrogram_02.png
```

Rate 2k Monocolor
```
sox __voice__.mp3 -n rate 2k spectrogram -m -o spectrogram_04.png
```
