#!/bin/bash

echo "This script generates a product GIF"

echo "usage: gif.sh video.webm"

# one thing I want to emphasize for these gifs is they should be a little more zoomed in. Consider recording a mobile view, or setting the browser resolution a bit lower. This makes it easier to see the interactions, and allows us to keep things loading quickly. 640x480 or 320x600 are good resolutions to use. A bit bigger is ok, but don't make a 1920x1080 GIF

ffmpeg -ss 60 -t 45 -i $1 -vf "fps=10,scale=800:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse,crop=600:400:100:45,setpts=0.25*PTS" -loop 0 output.gif
