#!/bin/bash
# author: Jas0n0ss
# github: github.com/Jas0n0ss
# date: 2023-01-17

echo "####################################" | lolcat
echo "# Usage: ./tubedownloader.sh <URL> #" |lolcat
echo "####################################" | lolcat

# List all video types and video Quality

echo  "All Available 2K above mp4 format list: " | lolcat
echo  "#################################################" | lolcat
yt-dlp -F $1 | grep -E  "^399|^137|^400|^401" | lolcat
echo  "#################################################" | lolcat
echo  "All Available mpa audio format list: " | lolcat
echo  "#################################################" | lolcat
yt-dlp -F $1 | grep -w m4a |lolcat
echo "Vide ID Please (The first row of the Number), leave it blank will download 4K mp4:" |lolcat
read -r vID
VID=${vID:-"401"}
echo "Audio ID Please (The first row of the Number), leave it blank will download best m4a:" |lolcat
read -r aID
AID=${aID:-"140"}
QUA="${VID}+${AID}"

echo  "Please enter the Path you want to save the video:" | lolcat
read -r V_PATH
# Best quality By default
yt-dlp -f $QUA -P $V_PATH --restrict-filenames $1 | lolcat
echo  "#################################################" | lolcat
echo  "#################################################" | lolcat
lolcat && echo "Successful downloaded to $V_PATH" | lolcat
echo  "#################################################" | lolcat
echo  "#################################################" | lolcat
