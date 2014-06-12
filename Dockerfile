# Phusion Redis
FROM phusion/baseimage:0.9.10

MAINTAINER Justin Cunningham <justin@bulletprooftiger.com>

RUN apt-get update
RUN apt-get upgrade -y

# Install automatic security updates
RUN sudo apt-get install -y unattended-upgrades
ADD config/20auto-upgrades /etc/apt/apt.conf.d/20auto-upgrades

# Install redis
RUN apt-get install -y redis-server

# Enable redis
RUN mkdir /etc/service/redis
ADD config/redis /etc/service/redis/run
RUN chmod +x /etc/service/redis/run

# Configure redis
RUN sed -i 's/daemonize yes/daemonize no/g' /etc/redis/redis.conf
RUN sed -i 's/bind 127.0.0.1/# bind 127.0.0.1/g' /etc/redis/redis.conf

# Setup a volume that will contain the db
VOLUME /var/lib/redis

# Expose the port and run it
EXPOSE 6379
CMD ["/sbin/my_init"]