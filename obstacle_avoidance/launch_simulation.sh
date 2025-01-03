#!/bin/bash

cd "$(dirname "$0")"
DIRECTORY=$PWD
# forward x11 GUI in case it wasnt done
cd /root/
xauth merge /root/.Xauthority

cd $DIRECTORY
colcon build
source install/setup.bash
source /usr/share/gazebo/setup.bash 

ros2 launch obstacle_avoidance turtlebot3_world_navigation.launch.py
