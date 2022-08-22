#!/usr/bin/env python3

import tf
import rospy
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Point, Quaternion
from sensor_msgs.msg import PointCloud2, PointField
from std_msgs.msg import Header
import numpy as np
import sensor_msgs.point_cloud2 as pc

from raytracer_pkg.msg import represent_plane, represent_ray
#from raytracer_pkg import LiDAR


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
		
class Wall:

	def __init__(self,point,orient):
		self.pub_wall_marker = rospy.Publisher('/wall', Marker, queue_size=1)
		
		## Marker Properties
		self.wall_marker = Marker()
		self.wall_marker.ns = "Wall"
		self.wall_marker.id = 1
		self.wall_marker.header.frame_id = "wall_frame"
		self.wall_marker.header.stamp    = rospy.get_rostime()
		self.wall_marker.type = Marker.CUBE
		self.wall_marker.action = Marker.ADD
		self.wall_marker.lifetime = rospy.Duration(0)
		
		# Wall Scale Values (dimensions)
		self.wall_marker.scale.x = 0.5
		self.wall_marker.scale.y = 20.0
		self.wall_marker.scale.z = 5.0
		
		# Wall Colour
		self.wall_marker.color.r = 1.0
		self.wall_marker.color.g = 1.0
		self.wall_marker.color.b = 1.0
		# This has to be; otherwise, it will be transparent
		self.wall_marker.color.a = 1.0
		
		# Set position and orientation of the Wall
		self.set_pose(point,orient)
		
		self.pub_wall_marker.publish(self.wall_marker)
		
	def set_pose(self,pt,otn):
		self.wall_marker.pose.position = pt
		self.wall_marker.pose.orientation = otn
			
class PointCloudData:

	def __init__(self,lidar_obj):

		self.pub_pcd = rospy.Publisher('/point_cloud_data', PointCloud2, queue_size=1)
		pcd_info = "PCD_for_Lidar" + str(lidar_obj.lidar_marker.id)

		self.angles = {
	  	"horizontal":np.arange(-(lidar_obj.fov["horizontal"]/2),(lidar_obj.fov["horizontal"]/2),lidar_obj.resolution),
	  	"vertical":np.arange(-(lidar_obj.fov["vertical"]/2),(lidar_obj.fov["vertical"]/2),lidar_obj.resolution)
		}
		
		y = 1 * np.tan(np.deg2rad(self.angles["horizontal"]))
		z = 1 * np.tan(np.deg2rad(self.angles["vertical"]))
		yv, zv = np.meshgrid(y, z)
		pts_array = np.append(np.ones((yv.size,1)),(np.append(yv.reshape(yv.size,1),zv.reshape(zv.size,1),axis=1)),axis=1)
		
		self.cloud = PointCloud2()
		
		self.cloud = self.array_to_pc2(pts_array, rospy.get_rostime(), "lidar_frame")
		#self.cloud = pc.array_to_pointcloud2(self.pts_array,stamp = rospy.get_rostime(),frame_id = "lidar_frame") 		
		
		self.pub_pcd.publish(self.cloud)
	
	def array_to_pc2(self,cloud_arr, stamp=None, frame_id=None):
		
		fields = [PointField('x', 0, PointField.FLOAT32, 1),
			  PointField('y', 4, PointField.FLOAT32, 1),
			  PointField('z', 8, PointField.FLOAT32, 1)]
			
		header = Header()
		header.frame_id = frame_id
		header.stamp = stamp

		cloud_arr = cloud_arr.reshape(-1,3)
		pc2 = pc.create_cloud(header, fields, cloud_arr)
		return pc2
		
if __name__ == '__main__':

	rospy.init_node('visualize_markers', anonymous=True)
	
	rate = rospy.Rate(10) # 10hz
	lid_q = tf.transformations.quaternion_from_euler(np.deg2rad(0), np.deg2rad(2), np.deg2rad(0))
	while not rospy.is_shutdown():  
	       
		info = "Started publishing markers for visualization at %s" % rospy.get_time()
		rospy.loginfo(info)
		
		lidar_pos = Point()
		lidar_pos.x = 0.5
		lidar_pos.y = 0.0
		lidar_pos.z = 1.0
		lidar_orient = Quaternion()
		lidar_orient.x = lid_q[0]
		lidar_orient.y = lid_q[1]
		lidar_orient.z = lid_q[2]
		lidar_orient.w = lid_q[3]
		wall_pos = Point()
		wall_pos.x = 0.0
		wall_pos.y = 0.0
		wall_pos.z = 0.0
		wall_orient = Quaternion()
		wall_orient.x = 0
		wall_orient.y = 0
		wall_orient.z = 0
		wall_orient.w = 1

		
		lidar1 = LiDAR(1,lidar_pos,lidar_orient)
		pcd = PointCloudData(lidar1)
		
		#LiDAR(2,lidar_pos,lidar_orient)
		#LiDAR(3,lidar_pos,lidar_orient)
		wall1 = Wall(wall_pos,wall_orient)
		
		br = tf.TransformBroadcaster()
		br.sendTransform((lidar_pos.x, lidar_pos.y, lidar_pos.z),
				tuple(lid_q),
				rospy.get_rostime(),
				"lidar_frame",
				"/world")
				
		lid_br = tf.TransformBroadcaster()
		lid_br.sendTransform((20.0+(0.5/2), 0.0, 5.0/2),
				tuple([0,0,0,1]),
				rospy.get_rostime(),
				"wall_frame",
				"/world")
		
		rate.sleep()

