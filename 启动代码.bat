@echo off
echo Starting Docker build process...
docker build -t skynet_docker .

echo Running Docker container...
docker run -d --name service-DB ^
    -p 8000:8000 ^
    -p 9000:9000 ^
    -v "%CD%/src:/yhx/src" ^
    skynet_docker ^
    ../skynet/skynet ./etc/config.nodedb

echo Docker container started.
pause
