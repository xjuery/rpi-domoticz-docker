#
# Dockerfile for Rpi-Domoticz
#
# Based on version by LBTM
#
# Base image.
FROM resin/rpi-raspbian:buster-20190121

LABEL maintainer="fchauveau, xjuery"

RUN \
  apt-get update && \
  apt-get install -y cmake apt-utils build-essential && \
  apt-get install -y python3-dev libboost-dev libboost-thread-dev libboost-system-dev libsqlite3-dev subversion curl libcurl4-gnutls-dev libusb-dev zlib1g-dev && \
  apt-get install -y iputils-ping && \
  apt-get clean && \
  apt-get autoclean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 8080

CMD ["/root/domoticz/domoticz", "-www", "8080"]

ADD domoticz_linux_armv7l.tgz /root/domoticz
