FROM ubuntu:22.04


RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
&& sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update \
&& apt-get install  --no-install-recommends  wget openjdk-11-jre -y \
&& rm -rf /var/lib/apt/lists/*

COPY install_zk.sh /data/install_zk.sh
ARG ZOOKEEPER_VERSION
ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64
RUN /data/install_zk.sh

COPY zookeeper /etc/init.d/zookeeper

COPY start_zk.sh /start.sh

CMD [ "/start.sh" ]
