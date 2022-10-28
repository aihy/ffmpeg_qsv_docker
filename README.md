# ffmpeg_vaapi_docker

> Tested on Linux

## Docker Hub

https://hub.docker.com/r/wzhy1234/ffmpeg-qsv

## Usage

1. `sudo docker run --privileged -it -v /your_media:/mnt wzhy1234/ffmpeg-qsv /bin/bash`
2. `in_container# ffmpeg -hwaccel qsv -c:v h264_qsv -i test_ori.mp4 -c:v hevc_qsv -global_quality 22 -tag:v hvc1 -look_ahead 1 out.mp4`

## Build

1. `git clone git@github.com:aihy/ffmpeg_qsv_docker.git`
2. `cd ffmpeg_qsv_docker`
3. `sudo docker build -t ffmpeg-qsv .`
4. `sudo docker run --privileged -it -v /your_media:/mnt ffmpeg-qsv /bin/bash`
5. `in_container# ffmpeg -hwaccel qsv -c:v h264_qsv -i test_ori.mp4 -c:v hevc_qsv -global_quality 22 -tag:v hvc1 -look_ahead 1 out.mp4`
