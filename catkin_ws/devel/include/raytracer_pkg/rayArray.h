// Generated by gencpp from file raytracer_pkg/rayArray.msg
// DO NOT EDIT!


#ifndef RAYTRACER_PKG_MESSAGE_RAYARRAY_H
#define RAYTRACER_PKG_MESSAGE_RAYARRAY_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <raytracer_pkg/represent_ray.h>

namespace raytracer_pkg
{
template <class ContainerAllocator>
struct rayArray_
{
  typedef rayArray_<ContainerAllocator> Type;

  rayArray_()
    : rays()  {
    }
  rayArray_(const ContainerAllocator& _alloc)
    : rays(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector< ::raytracer_pkg::represent_ray_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::raytracer_pkg::represent_ray_<ContainerAllocator> >::other >  _rays_type;
  _rays_type rays;





  typedef boost::shared_ptr< ::raytracer_pkg::rayArray_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::raytracer_pkg::rayArray_<ContainerAllocator> const> ConstPtr;

}; // struct rayArray_

typedef ::raytracer_pkg::rayArray_<std::allocator<void> > rayArray;

typedef boost::shared_ptr< ::raytracer_pkg::rayArray > rayArrayPtr;
typedef boost::shared_ptr< ::raytracer_pkg::rayArray const> rayArrayConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::raytracer_pkg::rayArray_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::raytracer_pkg::rayArray_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::raytracer_pkg::rayArray_<ContainerAllocator1> & lhs, const ::raytracer_pkg::rayArray_<ContainerAllocator2> & rhs)
{
  return lhs.rays == rhs.rays;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::raytracer_pkg::rayArray_<ContainerAllocator1> & lhs, const ::raytracer_pkg::rayArray_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace raytracer_pkg

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::raytracer_pkg::rayArray_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::raytracer_pkg::rayArray_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::raytracer_pkg::rayArray_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::raytracer_pkg::rayArray_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::raytracer_pkg::rayArray_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::raytracer_pkg::rayArray_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::raytracer_pkg::rayArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4e8a626364221c9b6fef233183f4edb0";
  }

  static const char* value(const ::raytracer_pkg::rayArray_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4e8a626364221c9bULL;
  static const uint64_t static_value2 = 0x6fef233183f4edb0ULL;
};

template<class ContainerAllocator>
struct DataType< ::raytracer_pkg::rayArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "raytracer_pkg/rayArray";
  }

  static const char* value(const ::raytracer_pkg::rayArray_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::raytracer_pkg::rayArray_<ContainerAllocator> >
{
  static const char* value()
  {
    return "represent_ray[] rays\n"
"\n"
"================================================================================\n"
"MSG: raytracer_pkg/represent_ray\n"
"  Header header\n"
"  geometry_msgs/Point origin\n"
"  geometry_msgs/Vector3 direction\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Point\n"
"# This contains the position of a point in free space\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Vector3\n"
"# This represents a vector in free space. \n"
"# It is only meant to represent a direction. Therefore, it does not\n"
"# make sense to apply a translation to it (e.g., when applying a \n"
"# generic rigid transformation to a Vector3, tf2 will only apply the\n"
"# rotation). If you want your data to be translatable too, use the\n"
"# geometry_msgs/Point message instead.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 z\n"
;
  }

  static const char* value(const ::raytracer_pkg::rayArray_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::raytracer_pkg::rayArray_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.rays);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct rayArray_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::raytracer_pkg::rayArray_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::raytracer_pkg::rayArray_<ContainerAllocator>& v)
  {
    s << indent << "rays[]" << std::endl;
    for (size_t i = 0; i < v.rays.size(); ++i)
    {
      s << indent << "  rays[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::raytracer_pkg::represent_ray_<ContainerAllocator> >::stream(s, indent + "    ", v.rays[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // RAYTRACER_PKG_MESSAGE_RAYARRAY_H
