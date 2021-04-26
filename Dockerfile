FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y -q apt-utils libnuma-dev unzip libva-dev libmfx-dev intel-media-va-driver-non-free gcc libsdl2-dev cmake libbluray-dev libx264-dev libx265-dev wget && cd /root && wget https://github.com/FFmpeg/FFmpeg/archive/refs/tags/n3.0.zip && unzip FFmpeg-n3.0.zip && cd FFmpeg-n3.0 && sed -i 's/llibmfx/lmfx/g' configure && /root/FFmpeg-n3.0/configure --arch=x86_64 --disable-yasm --enable-vaapi --enable-libmfx --enable-libbluray --enable-nonfree --enable-gpl --enable-libx264 --enable-libx265 && make -j8 && make install
ENV LIBVA_DRIVER_NAME iHD
WORKDIR /mnt
