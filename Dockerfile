FROM ubuntu:jammy
ARG DEBIAN_FRONTEND=noninteractive
ARG FFMPEG_VERSION=5.1.2
RUN apt-get update && apt-get install -y -q libmfx1 libmfx-tools libva-drm2 libva-x11-2 libva-wayland2 libva-glx2 vainfo yasm wget vim locales less pkg-config gcc cmake intel-media-va-driver-non-free libva-dev libmfx-dev g++ libbluray-dev libx264-dev libx265-dev libass-dev
RUN cd /tmp && wget https://www.ffmpeg.org/releases/ffmpeg-$FFMPEG_VERSION.tar.xz && tar xJf ffmpeg-$FFMPEG_VERSION.tar.xz && cd ffmpeg-$FFMPEG_VERSION && ./configure --enable-libmfx --enable-nonfree --enable-libbluray --enable-fontconfig --enable-libass --enable-gpl --enable-libx264 --enable-libx265 --enable-vaapi && make -j8 && make install
ENV LIBVA_DRIVER_NAME iHD
ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
RUN echo "C.UTF-8 UTF-8" >> /etc/locale.gen
RUN locale-gen
WORKDIR /media
