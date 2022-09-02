FROM openjdk:11

COPY install_zk.sh /data/install_zk.sh
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update \
&& apt-get install  --no-install-recommends  wget -y \
&& rm -rf /var/lib/apt/lists/*

ARG ZOOKEEPER_VERSION
RUN /data/install_zk.sh
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
