# This is an auto generated Dockerfile for ros:desktop
# generated from docker_images_ros2/create_ros_image.Dockerfile.em
FROM ros:humble-ros-base-jammy

ENV HOME=/home
# bash needed instead of sh to source files
SHELL ["/bin/bash", "-c"]

# install ros2 packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-humble-desktop=0.10.0-1* \
    && rm -rf /var/lib/apt/lists/*

# xauth to forward GUI + vim
RUN apt-get update && apt-get install -y \
    xauth \
    x11-apps \
    vim

# setup according to https://medium.com/@nilutpolkashyap/setting-up-turtlebot3-simulation-in-ros-2-humble-hawksbill-70a6fcdaf5de
# gazebo + ROS2 cartographer, navigation stacks
RUN apt-get update && apt-get install -y \
    gazebo \
    ros-humble-gazebo-ros-pkgs \
    ros-humble-cartographer \
    ros-humble-cartographer-ros \
    ros-humble-navigation2 \
    ros-humble-nav2-bringup 

# workspace
RUN mkdir -p $HOME/turtlebot3_ws/src
WORKDIR $HOME/turtlebot3_ws/src

# turtlebot3 packages
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git -b humble-devel
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3.git -b humble-devel
RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git -b humble-devel
RUN git clone https://github.com/ROBOTIS-GIT/DynamixelSDK.git -b humble-devel

WORKDIR $HOME/turtlebot3_ws
RUN . /opt/ros/humble/setup.sh && colcon build

# bashrc edits
RUN echo ". /opt/ros/humble/setup.sh" >> ~/.bashrc
RUN echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc
RUN echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
RUN echo 'source /usr/share/gazebo/setup.bash' >> ~/.bashrc
