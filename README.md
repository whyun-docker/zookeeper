# zookeeper

本地测试使用 zookeeper 镜像，启动过程中监听日志变动，在端口监听成功后才判定服务启动成功，方便查看启动状态。

## 镜像 tag

yunnysunny/zookeeper:${ZOOKEEPER_VERSION}

当前支持的版本有

- 3.7.1