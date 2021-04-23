# ffmpeg_qsv_docker

## Usage

1. `git clone git@github.com:aihy/ffmpeg_qsv_docker.git`
2. `cd ffmpeg_qsv_docker`
1. `sudo docker build -t ffmpeg-qsv .`
3. `sudo docker run --privileged -it -v /your_media:/mnt ffmpeg-qsv /bin/bash`
1. `in_container# ffmpeg -hwaccel qsv -c:v h264_qsv -i test_ori.mp4 -c:v hevc_qsv -global_quality 22 -tag:v hvc1 -look_ahead 1 out.mp4`
