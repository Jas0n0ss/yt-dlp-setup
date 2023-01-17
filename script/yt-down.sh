#!/bin/bash
# author: Jas0n0ss
# github: github.com/Jas0n0ss
# date: 2023-01-17

# define Color
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
end="\033[0m"


os_check(){
if [ "$(uname)" == "Darwin" ];then
    OS=macOS
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ];then
    OS=Linux
fi
}

# https://github.com/yt-dlp/yt-dlp#installation
yt-dlp_install(){
os_check
if [ $OS == Linux ];then
    sudo curl -L -o $(echo $PATH | awk -F ":" '{print $NF}')/yt-dlp https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp
    sudo chmod +x $(echo $PATH | awk -F ":" '{print $NF}')/yt-dlp
    which yt-dlp
elif [ $OS == macOS ];then
   #sudo curl -L -o $(echo $PATH | awk -F ":" '{print $NF}')/yt-dlp https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_macos
   brew install yt-dlp 
   which yt-dlp
else
    echo -e "${red}unsupported operating System${end}!!"
    echo -e "${yellow}Please go to ${green}https://github.com/yt-dlp/yt-dlp#installation${end} to check.${end}"
fi
}

# https://github.com/yt-dlp/FFmpeg-Builds#downloads
ffmpeg_install(){
os_check
if [ $OS == "Linux" ];then
    curl -L -o ffmpeg.tar.xz https://github.com/yt-dlp/FFmpeg-Builds/releases/download/latest/ffmpeg-master-latest-linux64-gpl.tar.xz
    tar -xvf ffmpeg.tar.xz && mv ffmpeg-master-latest-linux64-gpl ffmpeg && cd ffmpeg
    export PATH=$PATH:${PWD}/bin
    which ffmpeg && ffmpeg
else
    # since bugfixed ffmpeg is not supported on macOS , we try to use Official ffmpeg
    brew install ffmpeg
fi
}


# Check yt-dlp Existence
yt-dlp_check(){
echo -e "${yellow}Checking yt-dlp if installed on your host...${end}"
which yt-dlp > /dev/null
if [ $? = 0 ];then
    echo -e "${green}You have installed ty-dlp on your machine! Will Proceed to the next step on ffmpeg checking...${end}"
else
    yt-dlp_install
fi
}

# Check ffmpeg Existence
ffmpeg_check(){
echo -e "${yellow}Checking ffmpeg if installed on your host...${end}"
which ffmpeg > /dev/null
if [ $? == 0 ];then
    echo -e "${green}You have installed ffmpeg on your machine! Will Proceed to the next step on video downloading.${end}"
else
    ffmpeg_install
fi
}

video_start(){
yt-dlp_check
ffmpeg_check
echo -e "${yellow}Please enter the video URL: ${end}"
read -r URL
# List all video types and video Quality
yt-dlp -F $URL
echo -e  "${yellow}Please enter the video Quality you want to download (The Number before vodio types), leave it blank will download best Quality of mp4:${end} "
read -r QUA
echo -e  "${yellow}Please enter the Path you want to save the video(like /data/video): ${end}"
read -r V_PATH
# Best quality By default
Quality=${QUA:-"best"}

if [ $Quality == best ];then
    yt-dlp -S "ext" -P $V_PATH --restrict-filenames $URL
else
    yt-dlp -f $QUA -P $V_PATH --restrict-filenames $URL
fi
}

# start
 video_start
