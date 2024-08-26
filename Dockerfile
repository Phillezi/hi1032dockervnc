FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

ENV USER=root

RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 \
    xfce4-goodies \
    tightvncserver \
    dbus-x11 \
    xfonts-base \
    xplot-xplot.org \
    tcptrace \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /root/.vnc \
    && echo "password" | vncpasswd -f > /root/.vnc/passwd \
    && chmod 600 /root/.vnc/passwd

RUN touch /root/.Xauthority

ENV RESOLUTION=1920x1080

WORKDIR /app

COPY docker/start-vnc.sh start-vnc.sh
RUN chmod +x start-vnc.sh

EXPOSE 5901

ENTRYPOINT [ "./start-vnc.sh" ]
