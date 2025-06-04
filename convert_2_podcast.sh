#!/bin/bash

image="background.jpg"
audio="podcast_notebooklm.wav"
output="video_youtube.mp4"

ffmpeg -loop 1 -i "$image" -i "$audio" -c:v libx264 -c:a aac -b:a 192k -shortest "$output"

echo "Conversion MFRB terminée : $output"

