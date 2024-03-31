@echo off
SET CONTAINER_NAME=service-DB
SET IMAGE_NAME=skynet_docker
SET SOURCE_PATH=src
SET START_SCRIPT=/yhx/src/s.sh

echo Checking if the container '%CONTAINER_NAME%' already exists...
docker container ls -a | findstr "%CONTAINER_NAME%" >nul 2>&1

if %errorlevel%==0 (
    echo Stopping existing container '%CONTAINER_NAME%'...
    docker stop %CONTAINER_NAME%
    echo Removing existing container '%CONTAINER_NAME%'...
    docker rm %CONTAINER_NAME%
)

echo Running Docker container...
docker run -d --name %CONTAINER_NAME% ^
    -p 8000:8000 ^
    -p 9000:9000 ^
    -v "%CD%/%SOURCE_PATH%:/yhx/%SOURCE_PATH%" ^
    %IMAGE_NAME% /bin/sh -c "%START_SCRIPT%"

if %errorlevel%==0 (
    echo Docker container '%CONTAINER_NAME%' started successfully.
) else (
    echo Docker container '%CONTAINER_NAME%' failed to start.
)

