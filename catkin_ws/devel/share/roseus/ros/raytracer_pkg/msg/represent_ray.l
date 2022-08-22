;; Auto-generated. Do not edit!


(when (boundp 'raytracer_pkg::represent_ray)
  (if (not (find-package "RAYTRACER_PKG"))
    (make-package "RAYTRACER_PKG"))
  (shadow 'represent_ray (find-package "RAYTRACER_PKG")))
(unless (find-package "RAYTRACER_PKG::REPRESENT_RAY")
  (make-package "RAYTRACER_PKG::REPRESENT_RAY"))

(in-package "ROS")
;;//! \htmlinclude represent_ray.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass raytracer_pkg::represent_ray
  :super ros::object
  :slots (_header _origin _direction ))

(defmethod raytracer_pkg::represent_ray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:origin __origin) (instance geometry_msgs::Point :init))
    ((:direction __direction) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _origin __origin)
   (setq _direction __direction)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:origin
   (&rest __origin)
   (if (keywordp (car __origin))
       (send* _origin __origin)
     (progn
       (if __origin (setq _origin (car __origin)))
       _origin)))
  (:direction
   (&rest __direction)
   (if (keywordp (car __direction))
       (send* _direction __direction)
     (progn
       (if __direction (setq _direction (car __direction)))
       _direction)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _origin
    (send _origin :serialization-length)
    ;; geometry_msgs/Vector3 _direction
    (send _direction :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _origin
       (send _origin :serialize s)
     ;; geometry_msgs/Vector3 _direction
       (send _direction :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _origin
     (send _origin :deserialize buf ptr-) (incf ptr- (send _origin :serialization-length))
   ;; geometry_msgs/Vector3 _direction
     (send _direction :deserialize buf ptr-) (incf ptr- (send _direction :serialization-length))
   ;;
   self)
  )

(setf (get raytracer_pkg::represent_ray :md5sum-) "6f48ec72d454524509d80bbcf717e192")
(setf (get raytracer_pkg::represent_ray :datatype-) "raytracer_pkg/represent_ray")
(setf (get raytracer_pkg::represent_ray :definition-)
      "  Header header
  geometry_msgs/Point origin
  geometry_msgs/Vector3 direction

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :raytracer_pkg/represent_ray "6f48ec72d454524509d80bbcf717e192")


