;; Auto-generated. Do not edit!


(when (boundp 'raytracer_pkg::rayArray)
  (if (not (find-package "RAYTRACER_PKG"))
    (make-package "RAYTRACER_PKG"))
  (shadow 'rayArray (find-package "RAYTRACER_PKG")))
(unless (find-package "RAYTRACER_PKG::RAYARRAY")
  (make-package "RAYTRACER_PKG::RAYARRAY"))

(in-package "ROS")
;;//! \htmlinclude rayArray.msg.html


(defclass raytracer_pkg::rayArray
  :super ros::object
  :slots (_rays ))

(defmethod raytracer_pkg::rayArray
  (:init
   (&key
    ((:rays __rays) ())
    )
   (send-super :init)
   (setq _rays __rays)
   self)
  (:rays
   (&rest __rays)
   (if (keywordp (car __rays))
       (send* _rays __rays)
     (progn
       (if __rays (setq _rays (car __rays)))
       _rays)))
  (:serialization-length
   ()
   (+
    ;; raytracer_pkg/represent_ray[] _rays
    (apply #'+ (send-all _rays :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; raytracer_pkg/represent_ray[] _rays
     (write-long (length _rays) s)
     (dolist (elem _rays)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; raytracer_pkg/represent_ray[] _rays
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rays (let (r) (dotimes (i n) (push (instance raytracer_pkg::represent_ray :init) r)) r))
     (dolist (elem- _rays)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get raytracer_pkg::rayArray :md5sum-) "4e8a626364221c9b6fef233183f4edb0")
(setf (get raytracer_pkg::rayArray :datatype-) "raytracer_pkg/rayArray")
(setf (get raytracer_pkg::rayArray :definition-)
      "represent_ray[] rays

================================================================================
MSG: raytracer_pkg/represent_ray
  Header header
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



(provide :raytracer_pkg/rayArray "4e8a626364221c9b6fef233183f4edb0")


