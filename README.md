
---

#### yt-dlp setup

> I have a write a  script to install and download the [yt-dlp](https://github.com/yt-dlp/yt-dlp#installation)  which is very powerful video downloader , so much cool than [YouTube-dl](https://github.com/ytdl-org/youtube-dl) including patched [ffmpeg](https://github.com/yt-dlp/FFmpeg-Builds#downloads). The biggest improvement is fixed at the download speed issue when use `youtibe-dl`.

#### Reference:

- https://github.com/ytdl-org/youtube-dl
- https://github.com/yt-dlp/FFmpeg-Builds#downloads
- https://github.com/yt-dlp/yt-dlp#installation

#### Script

- https://github.com/Jas0n0ss/yt-dlp-setup

#### Yt-dlp common used example

```bash
 # Best quality of video start with mp4
 yt-dlp -S "ext" -P <PATH> --restrict-filenames <URL>
 # list all available both video and audio from URL
 yt-dlp -F <URL>
 yt-dlp -f <id> -P <PATH> --restrict-filenames <URL>
```

`youtube-dl` VS` yt-dlp`

![image-20230117122733563.png](img/image-20230117122733563.png)

![image-20230117123008729.png](img/image-20230117123008729.png)

