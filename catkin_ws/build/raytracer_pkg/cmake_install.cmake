# Install script for directory: /home/demogorgon/Projects/Raytracing_Task/catkin_ws/src/raytracer_pkg

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/raytracer_pkg/msg" TYPE FILE FILES
    "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/src/raytracer_pkg/msg/represent_plane.msg"
    "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/src/raytracer_pkg/msg/represent_ray.msg"
    "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/src/raytracer_pkg/msg/rayArray.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/raytracer_pkg/cmake" TYPE FILE FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/build/raytracer_pkg/catkin_generated/installspace/raytracer_pkg-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/include/raytracer_pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/share/roseus/ros/raytracer_pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/share/common-lisp/ros/raytracer_pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/share/gennodejs/ros/raytracer_pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/lib/python3/dist-packages/raytracer_pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/lib/python3/dist-packages/raytracer_pkg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/raytracer_pkg" TYPE FILE FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/include/raytracer_pkg/lidar_poseConfig.h")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/raytracer_pkg" TYPE FILE FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/lib/python3/dist-packages/raytracer_pkg/__init__.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/lib/python3/dist-packages/raytracer_pkg/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages/raytracer_pkg" TYPE DIRECTORY FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/devel/lib/python3/dist-packages/raytracer_pkg/cfg")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/build/raytracer_pkg/catkin_generated/installspace/raytracer_pkg.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/raytracer_pkg/cmake" TYPE FILE FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/build/raytracer_pkg/catkin_generated/installspace/raytracer_pkg-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/raytracer_pkg/cmake" TYPE FILE FILES
    "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/build/raytracer_pkg/catkin_generated/installspace/raytracer_pkgConfig.cmake"
    "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/build/raytracer_pkg/catkin_generated/installspace/raytracer_pkgConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/raytracer_pkg" TYPE FILE FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/src/raytracer_pkg/package.xml")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/raytracer_pkg" TYPE PROGRAM FILES "/home/demogorgon/Projects/Raytracing_Task/catkin_ws/build/raytracer_pkg/catkin_generated/installspace/raytracer.py")
endif()

