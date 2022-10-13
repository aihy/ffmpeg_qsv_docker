FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y -q i965-va-driver vainfo apt-utils libnuma-dev libass-dev tar libva-dev libmfx-dev intel-media-va-driver-non-free g++ libsdl2-dev cmake libbluray-dev libx264-dev libx265-dev wget vim locales
RUN cd /root && wget https://www.ffmpeg.org/releases/ffmpeg-4.4.tar.xz && tar xJf ffmpeg-4.4.tar.xz && cd ffmpeg-4.4 && /root/ffmpeg-4.4/configure --arch=x86_64 --disable-yasm --enable-vaapi --enable-libass --enable-libmfx --enable-libbluray --enable-nonfree --enable-gpl --enable-libx264 --enable-libx265 && make -j8 && make install
ENV LIBVA_DRIVER_NAME i965
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN echo "C.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
WORKDIR /media
