#!/bin/bash
# ROS Kinetic "Workstation" Automated Install - credit goes to everyone
# Blame goes to ChrisL8
# This is to set up enough of ROS to use RVIZ and some other GUI tools,
# on a secondary system. It will not run a robot.

# Run this straight off of github like this:
# bash <(wget -qO- --no-cache https://raw.githubusercontent.com/chrisl8/ArloBot/master/workstation.sh)

BLACK='\033[0;30m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
ORANGE='\033[0;33m' # or brown
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTBLUE='\033[1;34m'
LIGHTGREEN='\033[1;32m'
LIGHTCYAN='\033[1;36m'
LIGHTRED='\033[1;31m'
LIGHTPURPLE='\033[1;35m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m' # NoColor

version=`lsb_release -sc`

printf "\n${YELLOW}[Checking the Ubuntu version]${NC}\n"
printf "${BLUE}Ubuntu ${version} found${NC}\n"
case ${version} in
  "wily" | "xenial")
;;
*)
printf "${RED}[This script will only work on Ubuntu Wily (15.10) and Xenial (16.04)]${NC}\n"
exit 1
esac

# I never use this, but if you are having time issues maybe uncomment this.
#printf "${YELLOW}[Installing chrony and setting the ntpdate]${NC}\n"
#sudo apt-get install -y chrony
#sudo ntpdate ntp.ubuntu.com



printf "\n${YELLOW}[Cloning or Updating git repositories]${NC}\n"

cd ~/catkin_ws/src
if ! [ -d ~/catkin_ws/src/slam_gmapping ]
    then
    https://github.com/ros-perception/slam_gmapping.git
else
    cd ~/catkin_ws/src/slam_gmapping
    git pull
fi

cd ~/catkin_ws/src
if ! [ -d ~/catkin_ws/src/amp ]
    then
    git https://github.com/sypronamp/amp.git
else
    cd ~/catkin_ws/src/amp
    git pull
fi
cd ~/catkin_ws

catkin_make

printf "\n${YELLOW}[AMP has been installed]${NC}\n"

