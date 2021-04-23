FROM ubuntu:20.04
COPY FFmpeg-master.zip /root/
COPY sources.list /etc/apt/sources.list
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update 
RUN apt-get install -y -q apt-utils
RUN apt-get install -y -q libnuma-dev unzip 
RUN apt-get install -y -q libva-dev libmfx-dev intel-media-va-driver-non-free 
RUN apt-get install -y -q gcc libsdl2-dev 
RUN apt-get install -y -q cmake libbluray-dev libx264-dev libx265-dev
RUN cd /root && unzip FFmpeg-master.zip
RUN cd /root/FFmpeg-master && sed -i 's/llibmfx/lmfx/g' configure
RUN cd /root/FFmpeg-master && /root/FFmpeg-master/configure --arch=x86_64 --disable-yasm --enable-vaapi --enable-libmfx --enable-libbluray --enable-nonfree --enable-gpl --enable-libx264 --enable-libx265 && make -j8 && make install
ENV LIBVA_DRIVER_NAME iHD
WORKDIR /mnt
