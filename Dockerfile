# 使用基础镜像
FROM ubuntu:latest

# 设置环境变量以支持UTF-8编码
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# 安装必要的工具和库
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    autoconf \
    libreadline-dev \
    libncurses5-dev \
    libssl-dev \
    gcc \
    curl \
    lua5.3 \
    liblua5.3-dev

# 克隆Skynet仓库
RUN git clone https://github.com/cloudwu/skynet.git /yhx/skynet

# 使用本地的src/llex.c替换容器里的skynet/3rd/lua/llex.c
# 请确保你在运行docker build命令的当前目录中有一个src目录和llex.c文件
COPY src/llex.c /yhx/skynet/3rd/lua/llex.c

# 清理第三方库编译的对象文件，然后重新编译，确保Lua也会重新编译
RUN cd /yhx/skynet && make cleanall && make linux

# 暴露Skynet需要的端口
EXPOSE 8000

# 设置工作目录
WORKDIR /yhx/skynet

# 当容器启动时运行Skynet
CMD ["./skynet", "etc/config.node0"]  # 假设配置文件在Skynet目录下
