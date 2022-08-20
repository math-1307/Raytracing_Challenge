#!/usr/bin/env python3

import rospy
from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
from geometry_msgs.msg import Point
from geometry_msgs.msg import Quaternion

class LiDAR:

	def __init__(self,lidar_num,point,orient):
		self.pub_lidar_marker = rospy.Publisher('/lidars', Marker, queue_size=1)
		
		# Marker Properties
		self.lidar_marker = Marker()
		self.lidar_marker.ns = "LiDAR"
		self.lidar_marker.id = lidar_num
		self.lidar_marker.header.frame_id = "/world"
		self.lidar_marker.header.stamp = rospy.get_rostime()
		self.lidar_marker.type = Marker.CUBE
		self.lidar_marker.action = Marker.ADD
		self.lidar_marker.lifetime = rospy.Duration(0)

		# LiDAR Scale Values (dimensions)
		self.lidar_marker.scale.x = 1.0
		self.lidar_marker.scale.y = 1.0
		self.lidar_marker.scale.z = 1.0
		
		# LiDAR Colour
		self.lidar_marker.color.r = 0.0
		self.lidar_marker.color.g = 0.0
		self.lidar_marker.color.b = 1.0
		# This has to be; otherwise, it will be transparent
		self.lidar_marker.color.a = 1.0
		
		# Set position and orientation of the LiDAR
		self.set_pose(point,orient)
		
	def set_pose(self,pt,otn):
		self.lidar_marker.pose.position = pt
		self.lidar_marker.pose.orientation = otn

class Wall:

	def __init__(self,point,orient):
		self.pub_wall_marker = rospy.Publisher('/wall', Marker, queue_size=1)
		
		## Marker Properties
		self.wall_marker = Marker()
		self.wall_marker.ns = "Wall"
		self.wall_marker.id = 1
		self.wall_marker.header.frame_id = "/world"
		self.wall_marker.header.stamp    = rospy.get_rostime()
		self.wall_marker.type = Marker.CUBE
		self.wall_marker.action = Marker.ADD
		self.wall_marker.lifetime = rospy.Duration(0)
		
		# Wall Scale Values (dimensions)
		self.wall_marker.scale.x = 1.0
		self.wall_marker.scale.y = 1.0
		self.wall_marker.scale.z = 1.0
		
		# LiDAR Colour
		self.wall_marker.color.r = 1.0
		self.wall_marker.color.g = 1.0
		self.wall_marker.color.b = 1.0
		# This has to be; otherwise, it will be transparent
		self.wall_marker.color.a = 1.0
		
		# Set position and orientation of the LiDAR
		self.set_pose(point,orient)
		
	def set_pose(self,pt,otn):
		self.wall_marker.pose.position = pt
		self.wall_marker.pose.orientation = otn
		
if __name__ == '__main__':

	rospy.init_node('visualize_markers', anonymous=True)
	
	rate = rospy.Rate(10) # 10hz
	
	while not rospy.is_shutdown():  
	       
		info = "Started publishing markers for visualization at %s" % rospy.get_time()
		rospy.loginfo(info)
		
		lidar_pos = Point()
		lidar_pos.x = 1.0
		lidar_pos.y = 1.0
		lidar_pos.z = 1.0
		lidar_orient = Quaternion()
		lidar_orient.x = 0
		lidar_orient.y = 0
		lidar_orient.z = 0
		lidar_orient.w = 1
		wall_pos = Point()
		wall_pos.x = 1.0
		wall_pos.y = 1.0
		wall_pos.z = 1.0
		wall_orient = Quaternion()
		wall_orient.x = 0
		wall_orient.y = 0
		wall_orient.z = 0
		wall_orient.w = 1
		
		lidar1 = LiDAR(1,lidar_pos,lidar_orient)
		#LiDAR(2,lidar_pos,lidar_orient)
		#LiDAR(3,lidar_pos,lidar_orient)
		wall1 = Wall(wall_pos,wall_orient)
		
		lidar1.pub_lidar_marker.publish(lidar1.lidar_marker)
		wall1.pub_wall_marker.publish(wall1.wall_marker)
		
		rate.sleep()


