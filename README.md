# skynet_docker
在docker中运行skynet服务器,摆脱linux束缚
代码存放在src,自动挂载
构建
docker build -t skynet_docker .
运行
docker run -d --name skynet-service \
    -p 8000:8000 \
    -p 9000:9000 \
    -v "$(pwd)/src:/yhx/src" \
    skynet_docker \
    /yhx/skynet/skynet /yhx/src/etc/config.nodedb\
