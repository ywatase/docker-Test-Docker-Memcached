FROM ubuntu:trusty

RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list
RUN echo "deb-src http://us.archive.ubuntu.com/ubuntu/ trusty-updates main restricted" >> /etc/apt/sources.list
RUN apt-get update

RUN dpkg-divert --local --rename --add /sbin/initctl

RUN apt-get install -y memcached

EXPOSE 11211

CMD ["/usr/bin/memcached", "-u", "memcache"]
