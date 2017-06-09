FROM resin/rpi-raspbian:wheezy  

RUN apt-get update && apt-get upgrade && \  
    apt-get -qy install --no-install-recommends \
    nano \
    wget \
    curl \
    ca-certificates \
    xserver-xorg \
    xinit \
    xserver-xorg-video-fbdev \
    lxde lxde-common \
    lightdm \
    chromium-browser

RUN adduser --disabled-password --gecos '' pi && \
    adduser pi sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

#install mouse support configuration file    
COPY "./containerFiles/10-input.conf" "/usr/share/X11/xorg.conf.d/10-input.conf"
COPY "./containerFiles/lightdm.conf" "/etc/lightdm/lightdm.conf"
COPY "./containerFiles/start.sh" "/root/start.sh"

#RUN chown pi:pi /home/pi/start.sh && chmod 777 /home/pi/start.sh

#USER pi
#WORKDIR /home/pi

CMD ["/root/start.sh"]