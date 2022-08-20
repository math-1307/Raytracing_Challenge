#!/usr/bin/env python

import rospy
import tf
from visualization_msgs.msg import Marker
from visualization_msgs.msg import MarkerArray
from geometry_msgs.msg import Point
from geometry_msgs.msg import Quaternion


if __name__ == '__main__':

	rospy.init_node('raytracer', anonymous=True)
	
	rate = rospy.Rate(10) # 10hz
	
	while not rospy.is_shutdown():
		
		#
		
		rate.sleep()

