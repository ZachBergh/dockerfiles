#
# NSQ Dockerfile
#
# https://github.com/dockerfile/nsq
#

# Pull base image.
FROM docker.cn/docker/ubuntu:14.04

# Install NSQ.
RUN \
  mkdir -p /tmp/nsq && \
  wget http://sazyer-music.stor.sinaapp.com/nsq-0.2.31.linux-amd64.go1.3.1.tar.gz -O - | tar -xvz --strip=1 -C /tmp/nsq && \
  mv /tmp/nsq/bin/* /usr/local/bin/ && \
  rm -rf /tmp/nsq

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]

# Expose ports.
EXPOSE 4150
EXPOSE 4151
EXPOSE 4160
EXPOSE 4161
EXPOSE 4171
