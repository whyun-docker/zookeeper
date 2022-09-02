FROM openjdk:11

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update \
&& apt-get install  --no-install-recommends  wget -y \
&& rm -rf /var/lib/apt/lists/*

COPY install_zk.sh /data/install_zk.sh
ARG ZOOKEEPER_VERSION
RUN /data/install_zk.sh

COPY zookeeper /etc/init.d/zookeeper

COPY start_zk.sh /start.sh

CMD [ "/start.sh" ]
