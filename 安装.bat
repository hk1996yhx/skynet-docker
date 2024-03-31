@echo off
echo Checking if the container 'service-DB' already exists...
docker container ls -a | findstr "service-DB" >nul 2>&1

if %errorlevel%==0 (
    echo Stopping existing container...
    docker stop service-DB
    echo Removing existing container...
    docker rm service-DB
)

echo Starting Docker build process...
docker build -t skynet_docker .

echo Running Docker container...
docker run -d --name service-DB -p 8000:8000 -p 9000:9000 -v "%CD%/src:/yhx/src" skynet_docker ../skynet/skynet ./etc/config.nodedb

if %errorlevel%==0 (
    echo Docker container started successfully.
) else (
    echo Docker container failed to start.
)
pause
