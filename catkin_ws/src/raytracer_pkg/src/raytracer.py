#!/usr/bin/env python

import tf
import tf2_ros
from tf.transformations import quaternion_matrix
import rospy
from visualization_msgs.msg import Marker, MarkerArray
from geometry_msgs.msg import Point, Quaternion
from sensor_msgs.msg import PointCloud2, PointField
from std_msgs.msg import Header
import numpy as np
import sensor_msgs.point_cloud2 as pc
#from dynamic_reconfigure.server import Server
#from dynamic_tutorials.cfg import TutorialsConfig

from raytracer_pkg.msg import represent_plane, represent_ray, rayArray
#from raytracer_pkg import LiDAR

class LiDAR:

	def __init__(self,lidar_num):
	
		self.lidar_frame = "lidar"+str(lidar_num)+"_frame"
		self.lidar_id = lidar_num
		
		lidar_topic = "/lidar"+str(self.lidar_id)
		self.pub_lidar_marker = rospy.Publisher(lidar_topic, Marker, queue_size=1)

		# Marker Properties
		self.lidar_marker = Marker()
		self.lidar_marker.ns = "LiDAR"
		self.lidar_marker.id = self.lidar_id
		self.lidar_marker.header.frame_id = self.lidar_frame
		self.lidar_marker.header.stamp = rospy.get_rostime()
		self.lidar_marker.type = Marker.CUBE
		self.lidar_marker.action = Marker.ADD
		self.lidar_marker.lifetime = rospy.Duration(0)
		
		# LiDAR pose w.r.t. lidar_frame
		self.lidar_marker.pose.position.x = 0.0
		self.lidar_marker.pose.position.y = 0.0
		self.lidar_marker.pose.position.z = 0.0
		self.lidar_marker.pose.orientation.x = 0.0
		self.lidar_marker.pose.orientation.y = 0.0
		self.lidar_marker.pose.orientation.z = 0.0
		self.lidar_marker.pose.orientation.w = 1.0

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
		
		#LiDAR Properties
		self.resolution = 1
		self.fov = {"vertical":20,"horizontal":30}
		
		self.defineRays()
		
		self.pub_lidar_marker.publish(self.lidar_marker)
		
	def defineRays(self):
		
		# To calibrate rays, a plane @ x = 1 is defined and y,z co-ordinates are calculated (Call it calibration plane)
		self.angles = {
	  	"horizontal":np.arange(-(self.fov["horizontal"]/2),(self.fov["horizontal"]/2),self.resolution),
	  	"vertical":np.arange(-(self.fov["vertical"]/2),(self.fov["vertical"]/2),self.resolution)
		}
		
		y = 1 * np.tan(np.deg2rad(self.angles["horizontal"]))
		z = 1 * np.tan(np.deg2rad(self.angles["vertical"]))
		yv, zv = np.meshgrid(y, z)
		pts_array = np.append(np.ones((yv.size,1)),(np.append(yv.reshape(yv.size,1),zv.reshape(zv.size,1),axis=1)),axis=1)
		
		# depicts rays (directional vector calculated from calibration plane)		
		self.rays = np.append(np.zeros((int(pts_array.size/3),3)),pts_array,axis=1)
		
		#mag = (np.sqrt((np.sum(np.multiply(self.rays,self.rays), axis = 1)).reshape(-1,1)))
		#self.rays = np.divide(self.rays,mag)
		
class Wall:

	def __init__(self):
		self.pub_wall_marker = rospy.Publisher('/wall', Marker, queue_size=1)
		
		# Dimensions
		self.dim_x = 0.5
		self.dim_y = 20.0
		self.dim_z = 5.0
		
		# Marker Properties
		self.wall_marker = Marker()
		self.wall_marker.ns = "Wall"
		self.wall_marker.id = 1
		self.wall_marker.header.frame_id = "wall_frame"
		self.wall_marker.header.stamp    = rospy.get_rostime()
		self.wall_marker.type = Marker.CUBE
		self.wall_marker.action = Marker.ADD
		self.wall_marker.lifetime = rospy.Duration(0)
		
		# Wall pose w.r.t. wall_frame
		self.wall_marker.pose.position.x = 0.0
		self.wall_marker.pose.position.y = 0.0
		self.wall_marker.pose.position.z = 0.0
		self.wall_marker.pose.orientation.x = 0.0
		self.wall_marker.pose.orientation.y = 0.0
		self.wall_marker.pose.orientation.z = 0.0
		self.wall_marker.pose.orientation.w = 1.0
		
		# Wall Scale Values (dimensions)
		self.wall_marker.scale.x = self.dim_x
		self.wall_marker.scale.y = self.dim_y
		self.wall_marker.scale.z = self.dim_z
		
		# Wall Colour
		self.wall_marker.color.r = 1.0
		self.wall_marker.color.g = 1.0
		self.wall_marker.color.b = 1.0
		# This has to be; otherwise, it will be transparent
		self.wall_marker.color.a = 1.0

		self.depictPlane()
		
		self.pub_wall_marker.publish(self.wall_marker)
		
		
	def depictPlane(self):
		
		y,z = np.meshgrid([-self.dim_y/2,self.dim_y/2],[-self.dim_z/2,self.dim_z/2])
		self.corners = np.append(-0.25*np.ones(((y.size,1))), np.append(y.reshape((y.size,1)),z.reshape((y.size,1)),1),1) # 4x3 matrix

		vec1 = np.asarray([self.corners[1,0]-self.corners[0,0], self.corners[1,1]-self.corners[0,1], self.corners[1,2]-self.corners[0,2]])
		vec2 = np.asarray([self.corners[2,0]-self.corners[0,0], self.corners[2,1]-self.corners[0,1], self.corners[2,2]-self.corners[0,2]])
		self.normal = np.cross(vec1,vec2).reshape(3,1)
		#self.normal = self.normal / np.linalg.norm(self.normal)
		#print("normalised normal " + str(self.normal))

class PointCloud:

	def __init__(self,lidar_obj, wall_obj, tf_buffer):

		pcd_id = lidar_obj.lidar_id
		
		#self.cloud = PointCloud2()
		#self.cloud = self.array_to_pc2(Rays.calibration_pts, rospy.get_rostime(), "lidar_frame")		
		#self.pub_pcd.publish(self.cloud)
		
		self.calc_POI(lidar_obj, wall_obj, tf_buffer)
		
		#self.POI.reshape(-1,3)
			
		
	def calc_POI(self,lidar_obj, plane, tf_buffer):

#		listener.waitForTransform('/lidar_frame','/wall_frame',rospy.Time(), rospy.Duration(4.0))	

		try:
			#print(lidar_obj.lidar_frame)
			trans = tf_buffer.lookup_transform(lidar_obj.lidar_frame, 'wall_frame', rospy.Time())#, rospy.Duration(1.0)) # frames from, to, time
#			print(trans.transform.rotation)
			q = [trans.transform.rotation.x, trans.transform.rotation.y, trans.transform.rotation.z, trans.transform.rotation.w]
			tr_mat = np.matrix(quaternion_matrix(q))
			tr_mat[0,3] = trans.transform.translation.x
			tr_mat[1,3] = trans.transform.translation.y
			tr_mat[2,3] = trans.transform.translation.z
			
			tr_mat = np.asarray(tr_mat).reshape(4,4)


			rays = lidar_obj.rays
						
			crnr = plane.corners
			
			crnr = np.append((crnr.T),np.ones((1,crnr.shape[0])),axis=0)
			crnr = tr_mat @ crnr # 4x4
			crnr = crnr / crnr[-1,:] # 4x4
			crnr = crnr[0:-1,:].T # 4x3
						
			tra = 0
			crnr1 = np.tile(crnr[0,:],(rays.shape[0],1))
			
			nrm = plane.normal.reshape(3,1)

			rot = tr_mat[0:3,0:3]
			nrm =  rot @ nrm
								
			nrm = np.tile(nrm.reshape(1,3),(rays.shape[0],1))
		
			nr = ((crnr1 - rays[:,0:3]) @ nrm.T).diagonal()
			dr = (rays[:,3:6] @ nrm.T).diagonal()

			t = (nr/dr).reshape(-1,1)
			t = np.tile(t,(1,3))

			poi = (rays[:,0:3]) + np.multiply(t, rays[:,3:6])
			
			poi = poi.tolist()

			poi = np.asarray(poi)
			
			try:
				trans2 = tf_buffer.lookup_transform('world', lidar_obj.lidar_frame, rospy.Time())#, rospy.Duration(1.0)) # frames from, to
				q = [trans2.transform.rotation.x, trans2.transform.rotation.y, trans2.transform.rotation.z, trans2.transform.rotation.w]
				tr2wrld = np.matrix(quaternion_matrix(q))
				tr2wrld[0,3] = trans2.transform.translation.x
				tr2wrld[1,3] = trans2.transform.translation.y
				tr2wrld[2,3] = trans2.transform.translation.z
				
				poiw = np.append((poi.T),np.ones((1,poi.shape[0])),axis=0) # 4x600
				poiw = tr2wrld @ poiw # 4x600
				poiw = poiw / poiw[-1,:] # 4x600
				poiw = poiw[0:-1,:].T # 600x3
				poiw = poiw.tolist()
				poiw = np.asarray(poiw)
				
				crnrw = np.append((crnr.T),np.ones((1,crnr.shape[0])),axis=0)
				crnrw = tr2wrld @ crnrw # 4x4
				crnrw = crnrw / crnrw[-1,:] # 4x4
				crnrw = crnrw[0:-1,:].T # 4x3
				
				#poiw = np.around(poiw,2)
				#poiw = poiw[(poiw[:,1]>=int(np.min(crnrw[:,1]))) & (poiw[:,1]>=np.max(crnrw[:,1]))] # setting y limits
				#poiw = poiw[(poiw[:,2]>=int(np.min(crnrw[:,2]))) & (poiw[:,2]>=int(np.max(crnrw[:,2])))] # setting z limits
				
				# Store pointcloud2 for all three LiDARs
				new_arr = np.empty((0,3))
				for pt in range(poiw.shape[0]):
					if((poiw[pt,1] >= np.min(crnrw[:,1])) and (poiw[pt,1] <= np.max(crnrw[:,1]))):
						if((poiw[pt,2] >= np.min(crnrw[:,2])) and (poiw[pt,2] <= np.max(crnrw[:,2]))):
							new_arr = np.append(new_arr, poiw[pt,:].reshape(1,3), axis = 0)
							self.POI = new_arr.reshape(-1,3)

			except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
				print("Transforms from wall to world not yet available")
				self.POI = None
				
		except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
			print("Transforms from world to " + lidar_obj.lidar_frame + " not yet available")
			self.POI = None			


def array_to_pc2(cloud_arr, stamp=None, frame_id=None):
	
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

	rospy.init_node('raytracer_node', anonymous=True)
	
	tf_buffer = tf2_ros.Buffer()
	tf2_listener = tf2_ros.TransformListener(tf_buffer)
	
	rate = rospy.Rate(10) # 10hz
	
	#lid_q = tf.transformations.quaternion_from_euler(np.deg2rad(0), np.deg2rad(2), np.deg2rad(0))
	
	lidar_poses = np.array([[0.5,0,1,0,2,0],[0,1,1,-5,2,10],[0,-1,1,5,2,-10]])
	#lidar_poses = np.array([[0.5,0,1,0,2,0],[0,1,1,-5,2,45],[0,-1,1,5,2,-45]])
	#lidar_poses = np.array([[0.5,0,1,0,0,0],[0,1,1,0,0,0],[0,-1,1,0,0,0]])
	
	while not rospy.is_shutdown():  
	       
		info = "Started publishing markers for visualization at %s" % rospy.get_time()
		#rospy.loginfo(info)

		wall1 = Wall()
		
		wall_br = tf.TransformBroadcaster()
		wall_br.sendTransform((20.0+(0.5/2), 0.0, 5.0/2),
				tuple([0,0,0,1]),
				rospy.get_rostime(),
				"wall_frame",
				"/world")
				
		combinedPOI = np.empty((0,3))
		
		for lid in range(lidar_poses.shape[0]):

			lidar = LiDAR(lid+1)
			lid_q = tf.transformations.quaternion_from_euler(np.deg2rad(lidar_poses[lid,3]),
									np.deg2rad(lidar_poses[lid,4]),
									np.deg2rad(lidar_poses[lid,5]))
			
			lid_br = tf.TransformBroadcaster()
#			lid_br.sendTransform((lidar_poses[lid,0], lidar_poses[lid,1], lidar_poses[lid,2]),
#					tuple(lid_q),
#					rospy.get_rostime(),
#					lidar.lidar_frame,
#					"/world")
			lid_br.sendTransform((lidar_poses[lid,0], lidar_poses[lid,1], lidar_poses[lid,2]),
					(lid_q[0],lid_q[1],lid_q[2],lid_q[3]),
					rospy.get_rostime(),
					lidar.lidar_frame,
					"/world")
			
			pcArr = PointCloud(lidar,wall1,tf_buffer)
			if pcArr.POI is not None:
				combinedPOI = np.append(combinedPOI, np.array(pcArr.POI).reshape(-1,3), axis = 0)
			
		# end of LiDAR loop
		
		pcd_topic = "/pcd_lidar"
		pub_pcd = rospy.Publisher(pcd_topic, PointCloud2, queue_size=1)
		print("Point Cloud Data of shape " + str(combinedPOI.shape))
		print(combinedPOI)
		if combinedPOI.any():
			cloud = PointCloud2()
			cloud = array_to_pc2(combinedPOI, rospy.get_rostime(), 'world')	
			pub_pcd.publish(cloud)

		rate.sleep()

	
