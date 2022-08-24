# LiDAR Raytracing
Simulation of LiDAR rays using ROS, RVIZ

#### Note
The project was created on a Linux Ubuntu 20.04 system installed with ROS Noetic

## Implementation Steps:
1. Clone the github repository "Raytracing_Challenge".
```Shell
git clone https://github.com/math-1307/Raytracing_Challenge
```
2. Makes sure you are inn the cloned repository and execute the following commands
```Shell
cd catkin_ws
catkin_make
source devel/setup.bash
roslaunch raytracer_pkg raytracer.launch
```
An RVIZ window and a Dynamic Reconguration window pop up for visualization of the point cloud

3. Optionally the pointcloud can be stored in a .pcd file using the following command in a parallel terminal
```Shell
source devel/setup.bash
rosrun pcl_ros pointcloud_to_pcd input:=/pcd_lidar
```

The implementation of the code can be seen in the [Implementation Video](https://github.com/math-1307/Raytracing_Challenge/blob/main/Results/raytracing_DB_implementation.mp4)
  
