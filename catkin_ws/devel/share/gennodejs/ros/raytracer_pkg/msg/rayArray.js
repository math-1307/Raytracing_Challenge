// Auto-generated. Do not edit!

// (in-package raytracer_pkg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let represent_ray = require('./represent_ray.js');

//-----------------------------------------------------------

class rayArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.rays = null;
    }
    else {
      if (initObj.hasOwnProperty('rays')) {
        this.rays = initObj.rays
      }
      else {
        this.rays = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type rayArray
    // Serialize message field [rays]
    // Serialize the length for message field [rays]
    bufferOffset = _serializer.uint32(obj.rays.length, buffer, bufferOffset);
    obj.rays.forEach((val) => {
      bufferOffset = represent_ray.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type rayArray
    let len;
    let data = new rayArray(null);
    // Deserialize message field [rays]
    // Deserialize array length for message field [rays]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.rays = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.rays[i] = represent_ray.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.rays.forEach((val) => {
      length += represent_ray.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'raytracer_pkg/rayArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4e8a626364221c9b6fef233183f4edb0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    represent_ray[] rays
    
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new rayArray(null);
    if (msg.rays !== undefined) {
      resolved.rays = new Array(msg.rays.length);
      for (let i = 0; i < resolved.rays.length; ++i) {
        resolved.rays[i] = represent_ray.Resolve(msg.rays[i]);
      }
    }
    else {
      resolved.rays = []
    }

    return resolved;
    }
};

module.exports = rayArray;
