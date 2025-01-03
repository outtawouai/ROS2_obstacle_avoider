#!/bin/bash
cd "$(dirname "$0")"

echo $HOME

docker run -it \
    -e DISPLAY=$DISPLAY \
    -v $HOME/.Xauthority:/root/.Xauthority:rw \
    -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
    -v /dev/shm:/dev/shm \
    -v $PWD:/home/problem1/ \
    --net=host \
    -w /home/problem1/ \
    turtlebot3_medium
