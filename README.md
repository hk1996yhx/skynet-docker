您可以通过以下命令在 Docker 中构建 Skynet 服务的镜像：

构建 Skynet Docker 镜像

docker build -t skynet_docker .

其中 -t skynet_docker 指定了镜像的标签，而 . 表示 Docker 上下文目录为当前目录（其中包含 Dockerfile 和 src 目录）。

使用下面的命令来启动 Skynet 容器：(下面每一行都是有\连接符,被格式化了)

docker run -d --name skynet-service \
    -p 8000:8000 \
    -p 9000:9000 \
    -v "${PWD}/src:/yhx/src" \
    skynet_docker \
    ../skynet/skynet ./etc/config.nodedb
    
这条命令的各个组成部分意味着：

- -d：后台运行容器。
- --name skynet-service：设置容器名称为 skynet-service。
- -p 8000:8000 和 -p 9000:9000：将容器内的 8000 和 9000 端口分别映射到主机的相同端口。
- -v "${PWD}/src:/yhx/src"：将当前工作目录下的 src 文件夹挂载到容器的 /yhx/src 目录下。请注意，$(pwd) 是 UNIX 风格的命令行，如果您在 Windows PowerShell 中运行，使用 ${PWD}，如果在 cmd.exe 中，则使用 %cd%。
- skynet_docker：告诉 Docker 使用名为 skynet_docker 的镜像来创建容器。
- ../skynet/skynet ./etc/config.nodedb：容器启动后要执行的命令，这里是启动 Skynet 服务。

请确保在运行上述命令之前，您的 ./src 目录中含有正确的 Skynet 配置文件，并且已经存在 ./src/etc/config.nodedb 路径。

这些命令可以让你在 Docker 中部署并运行 Skynet 服务，摆脱仅限于 Linux 系统的束缚。
你可以在 Docker 支持的任何系统上运行 Skynet 容器，包括 Windows 和 macOS。
仅供入门skynet学习使用,不做任何后期维护!
