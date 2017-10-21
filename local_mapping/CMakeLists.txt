cmake_minimum_required(VERSION 2.8.3)
project(local_mapping)

set(CMAKE_CXX_FLAGS "-std=c++11 ${CMAKE_CXX_FLAGS}")


find_package(catkin REQUIRED COMPONENTS
  grid_map_core
  grid_map_ros
  grid_map_msgs
  pcl_ros
  roscpp
  message_filters
  sensor_msgs
  std_msgs
  tf
  tf_conversions
  eigen_conversions
)

find_package(Boost REQUIRED COMPONENTS system)
find_package(Eigen3 REQUIRED)

catkin_package(
  INCLUDE_DIRS
    include
    ${Eigen_INCLUDE_DIRS}
  LIBRARIES
    ${PROJECT_NAME}_library
  CATKIN_DEPENDS
    grid_map_core
    grid_map_ros
    grid_map_msgs
    pcl_ros
    roscpp
    message_filters
    sensor_msgs
    std_msgs
    tf
    tf_conversions
    eigen_conversions
  DEPENDS
    Boost
)

include_directories(include
  ${catkin_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIRS}
  ${Eigen_INCLUDE_DIRS}
)

## Declare a cpp executable
add_executable(${PROJECT_NAME}
  src/local_mapping_node.cpp
)

target_link_libraries(${PROJECT_NAME}
  ${catkin_LIBRARIES}
)
