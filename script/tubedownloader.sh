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
echo "Vide ID Please (The first row of the Number), leave it blank will download 4K mp4:" |lolcat
read -r QUA
echo  "Please enter the Path you want to save the video:" | lolcat
read -r V_PATH
# Best quality By default
Quality=${QUA:-"4k"}

if [ $Quality == "4k" ];then
    yt-dlp -f 401 -P $V_PATH --restrict-filenames $1 | lolcat && echo "Successful downloaded to $V_PATH" | lolcat
else
    yt-dlp -f $QUA -P $V_PATH --restrict-filenames $1 | lolcat  && echo "Successful downloaded to $V_PATH" | lolcat
fi
