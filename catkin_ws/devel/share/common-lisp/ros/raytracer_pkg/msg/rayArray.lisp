; Auto-generated. Do not edit!


(cl:in-package raytracer_pkg-msg)


;//! \htmlinclude rayArray.msg.html

(cl:defclass <rayArray> (roslisp-msg-protocol:ros-message)
  ((rays
    :reader rays
    :initarg :rays
    :type (cl:vector raytracer_pkg-msg:represent_ray)
   :initform (cl:make-array 0 :element-type 'raytracer_pkg-msg:represent_ray :initial-element (cl:make-instance 'raytracer_pkg-msg:represent_ray))))
)

(cl:defclass rayArray (<rayArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <rayArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'rayArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raytracer_pkg-msg:<rayArray> is deprecated: use raytracer_pkg-msg:rayArray instead.")))

(cl:ensure-generic-function 'rays-val :lambda-list '(m))
(cl:defmethod rays-val ((m <rayArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:rays-val is deprecated.  Use raytracer_pkg-msg:rays instead.")
  (rays m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <rayArray>) ostream)
  "Serializes a message object of type '<rayArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'rays))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'rays))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <rayArray>) istream)
  "Deserializes a message object of type '<rayArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'rays) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'rays)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'raytracer_pkg-msg:represent_ray))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<rayArray>)))
  "Returns string type for a message object of type '<rayArray>"
  "raytracer_pkg/rayArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'rayArray)))
  "Returns string type for a message object of type 'rayArray"
  "raytracer_pkg/rayArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<rayArray>)))
  "Returns md5sum for a message object of type '<rayArray>"
  "4e8a626364221c9b6fef233183f4edb0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'rayArray)))
  "Returns md5sum for a message object of type 'rayArray"
  "4e8a626364221c9b6fef233183f4edb0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<rayArray>)))
  "Returns full string definition for message of type '<rayArray>"
  (cl:format cl:nil "represent_ray[] rays~%~%================================================================================~%MSG: raytracer_pkg/represent_ray~%  Header header~%  geometry_msgs/Point origin~%  geometry_msgs/Vector3 direction~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'rayArray)))
  "Returns full string definition for message of type 'rayArray"
  (cl:format cl:nil "represent_ray[] rays~%~%================================================================================~%MSG: raytracer_pkg/represent_ray~%  Header header~%  geometry_msgs/Point origin~%  geometry_msgs/Vector3 direction~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <rayArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'rays) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <rayArray>))
  "Converts a ROS message object to a list"
  (cl:list 'rayArray
    (cl:cons ':rays (rays msg))
))
