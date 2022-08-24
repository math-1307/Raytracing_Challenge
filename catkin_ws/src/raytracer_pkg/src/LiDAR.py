#!/usr/bin/env python

import tf
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
		self.lidar_marker.header.frame_id = "world"
		self.lidar_marker.header.stamp = rospy.get_rostime()
		self.lidar_marker.type = Marker.CUBE
		self.lidar_marker.action = Marker.ADD
		self.lidar_marker.lifetime = rospy.Duration(0)

		# LiDAR Scale Values (dimensions)
		self.lidar_marker.scale.x = 0.1
		self.lidar_marker.scale.y = 0.1
		self.lidar_marker.scale.z = 0.1
		
		# LiDAR Colour
		self.lidar_marker.color.r = 0.0
		self.lidar_marker.color.g = 0.0
		self.lidar_marker.color.b = 1.0
		# This has to be; otherwise, it will be transparent
		self.lidar_marker.color.a = 1.0
		
		# Set position and orientation of the LiDAR
		self.set_pose(point,orient)
		
		#LiDAR Properties
		self.resolution = 1
		self.fov = {"vertical":20,"horizontal":30}
		
		# Share data with PointCloud
		#PointCloudData.LiDAR_data(self)
		
		self.pub_lidar_marker.publish(self.lidar_marker)
		
	def set_pose(self,pt,otn):
		self.lidar_marker.pose.position = pt
		self.lidar_marker.pose.orientation = otn
