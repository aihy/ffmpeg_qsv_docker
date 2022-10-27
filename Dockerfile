FROM ubuntu:jammy
ARG DEBIAN_FRONTEND=noninteractive
ARG FFMPEG_VERSION=5.1.2
RUN apt-get update && apt-get install -y -q libgnutls28-dev libmp3lame-dev libopus-dev libtheora-dev libvorbis-dev libwebp-dev libzvbi-dev i965-va-driver vainfo apt-utils libnuma-dev libass-dev xz-utils libva-dev libmfx-dev intel-media-va-driver-non-free gcc libsdl2-dev cmake libbluray-dev libx264-dev libx265-dev wget vim locales libfdk-aac-dev less pkg-config yasm
RUN cd /tmp && wget https://www.ffmpeg.org/releases/ffmpeg-$FFMPEG_VERSION.tar.xz && tar xJf ffmpeg-$FFMPEG_VERSION.tar.xz && cd ffmpeg-$FFMPEG_VERSION && ./configure --arch=x86_64 --enable-x86asm --disable-doc --disable-ffplay --enable-libbluray --enable-nonfree --enable-fontconfig --enable-gnutls --enable-gpl --enable-iconv --enable-libass --enable-libfreetype --enable-libfribidi --enable-libmp3lame --enable-libopus --enable-libtheora --enable-libvorbis --enable-libwebp --enable-libx264 --enable-libx265 --enable-libzvbi --enable-version3 --enable-vaapi && make -j8 && make install
ENV LIBVA_DRIVER_NAME iHD
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN echo "C.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
WORKDIR /media
