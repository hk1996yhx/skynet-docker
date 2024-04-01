## 使用多阶段构建
# 第一阶段：编译
FROM ubuntu:latest as builder
# 更新软件包列表并安装编译依赖
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    autoconf \
    libreadline-dev \
    libncurses5-dev \
    libssl-dev \
    curl \
    lua5.3 \
    liblua5.3-dev
# 克隆 Skynet 仓库并编译
RUN git clone https://github.com/cloudwu/skynet.git /yhx/skynet
#变量中文化
COPY llex.c /yhx/skynet/3rd/lua/llex.c
RUN make -C /yhx/skynet/3rd/lua linux && make -C /yhx/skynet linux
# 第二阶段：生成最终镜像
FROM ubuntu:latest
# 安装 Skynet 运行时依赖的软件包
#RUN apt-get update && apt-get install -y  lua5.3 gcc g++ make autoconf automake libtool git
# 创建 Skynet 工作目录
WORKDIR /yhx/src
# 从编译阶段复制 Skynet 二进制文件到镜像中
COPY --from=builder /yhx/skynet /yhx/skynet
