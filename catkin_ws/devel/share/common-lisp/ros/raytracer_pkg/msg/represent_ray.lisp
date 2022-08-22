; Auto-generated. Do not edit!


(cl:in-package raytracer_pkg-msg)


;//! \htmlinclude represent_ray.msg.html

(cl:defclass <represent_ray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (origin
    :reader origin
    :initarg :origin
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (direction
    :reader direction
    :initarg :direction
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass represent_ray (<represent_ray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <represent_ray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'represent_ray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raytracer_pkg-msg:<represent_ray> is deprecated: use raytracer_pkg-msg:represent_ray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <represent_ray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:header-val is deprecated.  Use raytracer_pkg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'origin-val :lambda-list '(m))
(cl:defmethod origin-val ((m <represent_ray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:origin-val is deprecated.  Use raytracer_pkg-msg:origin instead.")
  (origin m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <represent_ray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:direction-val is deprecated.  Use raytracer_pkg-msg:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <represent_ray>) ostream)
  "Serializes a message object of type '<represent_ray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'origin) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'direction) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <represent_ray>) istream)
  "Deserializes a message object of type '<represent_ray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'origin) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'direction) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<represent_ray>)))
  "Returns string type for a message object of type '<represent_ray>"
  "raytracer_pkg/represent_ray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'represent_ray)))
  "Returns string type for a message object of type 'represent_ray"
  "raytracer_pkg/represent_ray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<represent_ray>)))
  "Returns md5sum for a message object of type '<represent_ray>"
  "6f48ec72d454524509d80bbcf717e192")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'represent_ray)))
  "Returns md5sum for a message object of type 'represent_ray"
  "6f48ec72d454524509d80bbcf717e192")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<represent_ray>)))
  "Returns full string definition for message of type '<represent_ray>"
  (cl:format cl:nil "  Header header~%  geometry_msgs/Point origin~%  geometry_msgs/Vector3 direction~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'represent_ray)))
  "Returns full string definition for message of type 'represent_ray"
  (cl:format cl:nil "  Header header~%  geometry_msgs/Point origin~%  geometry_msgs/Vector3 direction~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <represent_ray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'origin))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'direction))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <represent_ray>))
  "Converts a ROS message object to a list"
  (cl:list 'represent_ray
    (cl:cons ':header (header msg))
    (cl:cons ':origin (origin msg))
    (cl:cons ':direction (direction msg))
))
