; Auto-generated. Do not edit!


(cl:in-package raytracer_pkg-msg)


;//! \htmlinclude represent_plane.msg.html

(cl:defclass <represent_plane> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (corner1
    :reader corner1
    :initarg :corner1
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (corner2
    :reader corner2
    :initarg :corner2
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (corner3
    :reader corner3
    :initarg :corner3
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (corner4
    :reader corner4
    :initarg :corner4
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (normal
    :reader normal
    :initarg :normal
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass represent_plane (<represent_plane>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <represent_plane>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'represent_plane)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name raytracer_pkg-msg:<represent_plane> is deprecated: use raytracer_pkg-msg:represent_plane instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <represent_plane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:header-val is deprecated.  Use raytracer_pkg-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'corner1-val :lambda-list '(m))
(cl:defmethod corner1-val ((m <represent_plane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:corner1-val is deprecated.  Use raytracer_pkg-msg:corner1 instead.")
  (corner1 m))

(cl:ensure-generic-function 'corner2-val :lambda-list '(m))
(cl:defmethod corner2-val ((m <represent_plane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:corner2-val is deprecated.  Use raytracer_pkg-msg:corner2 instead.")
  (corner2 m))

(cl:ensure-generic-function 'corner3-val :lambda-list '(m))
(cl:defmethod corner3-val ((m <represent_plane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:corner3-val is deprecated.  Use raytracer_pkg-msg:corner3 instead.")
  (corner3 m))

(cl:ensure-generic-function 'corner4-val :lambda-list '(m))
(cl:defmethod corner4-val ((m <represent_plane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:corner4-val is deprecated.  Use raytracer_pkg-msg:corner4 instead.")
  (corner4 m))

(cl:ensure-generic-function 'normal-val :lambda-list '(m))
(cl:defmethod normal-val ((m <represent_plane>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader raytracer_pkg-msg:normal-val is deprecated.  Use raytracer_pkg-msg:normal instead.")
  (normal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <represent_plane>) ostream)
  "Serializes a message object of type '<represent_plane>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner1) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner2) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner3) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'corner4) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'normal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <represent_plane>) istream)
  "Deserializes a message object of type '<represent_plane>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner1) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner2) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner3) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'corner4) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'normal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<represent_plane>)))
  "Returns string type for a message object of type '<represent_plane>"
  "raytracer_pkg/represent_plane")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'represent_plane)))
  "Returns string type for a message object of type 'represent_plane"
  "raytracer_pkg/represent_plane")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<represent_plane>)))
  "Returns md5sum for a message object of type '<represent_plane>"
  "29f9b3d844ed52a85b0f1b939894669b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'represent_plane)))
  "Returns md5sum for a message object of type 'represent_plane"
  "29f9b3d844ed52a85b0f1b939894669b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<represent_plane>)))
  "Returns full string definition for message of type '<represent_plane>"
  (cl:format cl:nil "  Header header~%  geometry_msgs/Point corner1~%  geometry_msgs/Point corner2~%  geometry_msgs/Point corner3~%  geometry_msgs/Point corner4~%  geometry_msgs/Vector3 normal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'represent_plane)))
  "Returns full string definition for message of type 'represent_plane"
  (cl:format cl:nil "  Header header~%  geometry_msgs/Point corner1~%  geometry_msgs/Point corner2~%  geometry_msgs/Point corner3~%  geometry_msgs/Point corner4~%  geometry_msgs/Vector3 normal~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <represent_plane>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner1))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner2))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner3))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'corner4))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'normal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <represent_plane>))
  "Converts a ROS message object to a list"
  (cl:list 'represent_plane
    (cl:cons ':header (header msg))
    (cl:cons ':corner1 (corner1 msg))
    (cl:cons ':corner2 (corner2 msg))
    (cl:cons ':corner3 (corner3 msg))
    (cl:cons ':corner4 (corner4 msg))
    (cl:cons ':normal (normal msg))
))
