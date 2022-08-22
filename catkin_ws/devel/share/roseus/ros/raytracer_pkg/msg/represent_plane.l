;; Auto-generated. Do not edit!


(when (boundp 'raytracer_pkg::represent_plane)
  (if (not (find-package "RAYTRACER_PKG"))
    (make-package "RAYTRACER_PKG"))
  (shadow 'represent_plane (find-package "RAYTRACER_PKG")))
(unless (find-package "RAYTRACER_PKG::REPRESENT_PLANE")
  (make-package "RAYTRACER_PKG::REPRESENT_PLANE"))

(in-package "ROS")
;;//! \htmlinclude represent_plane.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass raytracer_pkg::represent_plane
  :super ros::object
  :slots (_header _point _normal ))

(defmethod raytracer_pkg::represent_plane
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:point __point) (instance geometry_msgs::Point :init))
    ((:normal __normal) (instance geometry_msgs::Vector3 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _point __point)
   (setq _normal __normal)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:normal
   (&rest __normal)
   (if (keywordp (car __normal))
       (send* _normal __normal)
     (progn
       (if __normal (setq _normal (car __normal)))
       _normal)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ;; geometry_msgs/Vector3 _normal
    (send _normal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;; geometry_msgs/Vector3 _normal
       (send _normal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; geometry_msgs/Vector3 _normal
     (send _normal :deserialize buf ptr-) (incf ptr- (send _normal :serialization-length))
   ;;
   self)
  )

(setf (get raytracer_pkg::represent_plane :md5sum-) "e6dad39e8527110ab026c6017616f37b")
(setf (get raytracer_pkg::represent_plane :datatype-) "raytracer_pkg/represent_plane")
(setf (get raytracer_pkg::represent_plane :definition-)
      "  Header header
  geometry_msgs/Point point
  geometry_msgs/Vector3 normal

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



(provide :raytracer_pkg/represent_plane "e6dad39e8527110ab026c6017616f37b")


