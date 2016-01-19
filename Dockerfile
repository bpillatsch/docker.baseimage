FROM phusion/baseimage:0.9.18

# Use baseimage-docker's init system.
ENV DEBIAN_FRONTEND="noninteractive" HOME="/root" TERM="xterm" 

COPY ./my_init.d/*.sh /etc/my_init.d/
RUN useradd -u 911 -U -d /config -s /bin/false abc && usermod -G users abc && mkdir -p /config /app /defaults && \ 
apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold" && chmod +x /etc/my_init.d/*.sh && \
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/sbin/my_init"]
