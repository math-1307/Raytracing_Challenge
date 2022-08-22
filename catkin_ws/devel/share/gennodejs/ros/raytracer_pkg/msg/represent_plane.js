// Auto-generated. Do not edit!

// (in-package raytracer_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class represent_plane {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.corner1 = null;
      this.corner2 = null;
      this.corner3 = null;
      this.corner4 = null;
      this.normal = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('corner1')) {
        this.corner1 = initObj.corner1
      }
      else {
        this.corner1 = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('corner2')) {
        this.corner2 = initObj.corner2
      }
      else {
        this.corner2 = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('corner3')) {
        this.corner3 = initObj.corner3
      }
      else {
        this.corner3 = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('corner4')) {
        this.corner4 = initObj.corner4
      }
      else {
        this.corner4 = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('normal')) {
        this.normal = initObj.normal
      }
      else {
        this.normal = new geometry_msgs.msg.Vector3();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type represent_plane
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [corner1]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner1, buffer, bufferOffset);
    // Serialize message field [corner2]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner2, buffer, bufferOffset);
    // Serialize message field [corner3]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner3, buffer, bufferOffset);
    // Serialize message field [corner4]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.corner4, buffer, bufferOffset);
    // Serialize message field [normal]
    bufferOffset = geometry_msgs.msg.Vector3.serialize(obj.normal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type represent_plane
    let len;
    let data = new represent_plane(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner1]
    data.corner1 = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner2]
    data.corner2 = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner3]
    data.corner3 = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [corner4]
    data.corner4 = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [normal]
    data.normal = geometry_msgs.msg.Vector3.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 120;
  }

  static datatype() {
    // Returns string type for a message object
    return 'raytracer_pkg/represent_plane';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '29f9b3d844ed52a85b0f1b939894669b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
      Header header
      geometry_msgs/Point corner1
      geometry_msgs/Point corner2
      geometry_msgs/Point corner3
      geometry_msgs/Point corner4
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new represent_plane(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.corner1 !== undefined) {
      resolved.corner1 = geometry_msgs.msg.Point.Resolve(msg.corner1)
    }
    else {
      resolved.corner1 = new geometry_msgs.msg.Point()
    }

    if (msg.corner2 !== undefined) {
      resolved.corner2 = geometry_msgs.msg.Point.Resolve(msg.corner2)
    }
    else {
      resolved.corner2 = new geometry_msgs.msg.Point()
    }

    if (msg.corner3 !== undefined) {
      resolved.corner3 = geometry_msgs.msg.Point.Resolve(msg.corner3)
    }
    else {
      resolved.corner3 = new geometry_msgs.msg.Point()
    }

    if (msg.corner4 !== undefined) {
      resolved.corner4 = geometry_msgs.msg.Point.Resolve(msg.corner4)
    }
    else {
      resolved.corner4 = new geometry_msgs.msg.Point()
    }

    if (msg.normal !== undefined) {
      resolved.normal = geometry_msgs.msg.Vector3.Resolve(msg.normal)
    }
    else {
      resolved.normal = new geometry_msgs.msg.Vector3()
    }

    return resolved;
    }
};

module.exports = represent_plane;
