![](https://github.com/outtawouai/ROS2_obstacle_avoider/blob/main/gif.gif)

Simple control program that connects with Turtlebot3 in Gazebo and keeps it moving without colliding with obstacles in the standard World.

### Requirements

#### For execution inside interactive Docker container :

- Docker

#### For execution with one's own ROS2 + Gazebo install :

- ROS2 Humble
- Gazebo
- Turtlebot3 libraries

Tested with Ubuntu 22.04, Python 3.10, Gazebo11, ROS2 Humble

### Installation with Docker container (recommended)

0. Open terminal, get into this repo
1. Build docker image with `sudo docker buildx build -t turtlebot3_medium .`
2. Run interactive container with `bash run_docker.sh`
3. Check that GUI can be passed with `bash forward_x11.sh`. xeyes should be displayed on main screen (if not, check that the `.Xauthority` file is in `/home/.Xauthority` outside the container. If it isn't, either move it there or change its path in `run_docker.sh`)

### Launching the simulation with the Docker container

1. Run interactive container with `bash run_docker.sh`
2. Launch simuation using `bash obstacle_avoidance/launch_simulation.sh`

### Running the node separately

0. Run your Gazebo world and spawn the Turtlebot3 Burger, for example with `ros2 launch turtlebot3_gazebo turtlebot3_world.launch.py`
1. cd into `obstacle_avoidance`, then build the ROS2 package with `colcon build`
2. Run node with `ros2 run obstacle_avoidance obstacle_avoider`

### Sources

Environment : https://medium.com/@nilutpolkashyap/setting-up-turtlebot3-simulation-in-ros-2-humble-hawksbill-70a6fcdaf5de

ROS2 Dockefile : https://github.com/osrf/docker_images/blob/20e3ba685bb353a3c00be9ba01c1b7a6823c9472/ros/humble/ubuntu/jammy/desktop/Dockerfile
