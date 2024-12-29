(ROS2) Control program that connects with Turtlebot3 in Gazebo and keeps it moving without colliding with obstacles in the standard World.

### TODO :
Rewrite launch script so that the user doesn't have to specify a path. Use pwd ?

### Installation

0. Open terminal, get into current directory
1. Build docker image with `sudo docker buildx build -t ros_humble_base .`
2. Run interactive container with `sudo docker run -it -v "/home/tortue/Documents/qibi_1:/home/qibi_1" ros_humble_base`

