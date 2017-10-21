#include "ros/ros.h"
#include <grid_map_ros/grid_map_ros.hpp>
#include <grid_map_msgs/GridMap.h>
#include <sensor_msgs/PointCloud2.h>
#include <nav_msgs/OccupancyGrid.h>
#include <cmath>

using namespace grid_map;

int main(int argc, char **argv)
{
  ros::init(argc, argv, "local_mapping_node");
  ros::NodeHandle nh;

  ros::Publisher publisher = nh.advertise<grid_map_msgs::GridMap>("grid_map", 1 , true);
  ros::Publisher pc_pub = nh.advertise<sensor_msgs::PointCloud2>("grid_map_pc",1);
  ros::Publisher ocu_pup = nh.advertise<nav_msgs::OccupancyGrid>("grid_map_ouupency",1);

  GridMap map({"elevation"});
  map.setFrameId("map");
  map.setGeometry(Length(1.2, 2.0),0.03);
  ROS_INFO("Created map with size %f x %f m (%i x %i cells).",
           map.getLength().x() , map.getLength().y(),
           map.getSize()(0), map.getSize()(1));

  ros::Rate rate(30.0);

  while(nh.ok()){
    ros::Time time = ros::Time::now();
    for(GridMapIterator it(map); !it.isPastEnd(); ++it){
      Position position;
      map.getPosition(*it, position);
      map.at("elevation", *it) = -0.04 +
          0.2 * std::sin(3.0* time.toSec() +
                         5.0 * position.y()) * position.x();
    }

    map.setTimestamp(time.toNSec());
    grid_map_msgs::GridMap message;
    sensor_msgs::PointCloud2 pc_message;
    nav_msgs::OccupancyGrid og_message;
    GridMapRosConverter::toMessage(map,message);
    GridMapRosConverter::toPointCloud(map,{"elevation"},pc_message);
    GridMapRosConverter::toOccupancyGrid(map, "elevation", 20.0 , -20.0,og_message);
    publisher.publish(message);
    pc_pub.publish(pc_message);
    ocu_pup.publish(og_message);
    ROS_INFO_THROTTLE(1.0,"Grid map (timestamp %f) published.",
                      message.info.header.stamp.toSec());
    rate.sleep();
  }
  return 0;
}
