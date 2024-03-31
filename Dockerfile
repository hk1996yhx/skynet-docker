# 使用多阶段构建
# 第一阶段：编译
FROM alpine:latest as builder
# 安装构建依赖的软件包，并编译skynet
RUN apk add --no-cache \
    git \
    build-base \
    autoconf \
    readline-dev \
    ncurses-libs \
    ncurses-dev \
    openssl-dev \
    curl \
    lua5.3 \
    lua5.3-dev && \
    git clone https://github.com/cloudwu/skynet.git /yhx/skynet  
    COPY llex.c /yhx/skynet/3rd/lua/llex.c
    RUN  make -C /yhx/skynet/3rd/lua linux && \
    make -C /yhx/skynet linux

# 第二阶段：生成最终镜像
FROM alpine:latest
# 安装 Skynet 运行时依赖的软件包
RUN apk add --no-cache libstdc++ lua5.3-libs
# 创建 Skynet 工作目录
WORKDIR /yhx/src
# 从编译阶段复制 Skynet 二进制文件到镜像中
COPY --from=builder /yhx/skynet /yhx/skynet
