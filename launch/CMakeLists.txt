cmake_minimum_required(VERSION 2.8.3)
project(amp)

find_package(catkin REQUIRED)

catkin_package()

install(DIRECTORY launch
        DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}/
)

# unit tests are enabled selectively
if (CATKIN_ENABLE_TESTING)
  # check that all launch file dependencies are declared correctly
  find_package(roslaunch REQUIRED)
  find_package(arlobot_bringup REQUIRED)
  find_package(rtabmap_ros REQUIRED)
endif ()
