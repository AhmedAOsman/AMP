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

printf "\n${YELLOW}SETTING UP ROS KINETIC FOR YOUR REMOTE WORK!${NC}\n"
printf "${YELLOW}-------------------------------------------${NC}\n"
printf "${GREEN}You will be asked for your password for running commands as root!${NC}\n"

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

if ! [ -e /etc/apt/sources.list.d/ros-latest.list ]
    then
    printf "${YELLOW}[Adding the ROS repository]${NC}\n"
    # This should follow the official ROS install instructions closely.
    # That is why there is a separate section for extra packages that I need for Arlo.
    sudo sh -c "echo \"deb http://packages.ros.org/ros/ubuntu ${version} main\" > /etc/apt/sources.list.d/ros-latest.list"
    printf "${BLUE}[Checking the ROS keys]${NC}\n"
    roskey=`apt-key list | grep -i "ROS builder"`
    if [ -z "$roskey" ]
        then
        printf "${BLUE}[Adding the ROS keys]${NC}\n"
        sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 0xB01FA116
        printf "${BLUE}^^ He says it is 'OK'.${NC}\n"
    fi
fi


if ! [ -d ~/catkin_ws/src ]
    then
    printf "\n${YELLOW}[Creating the catkin workspace and testing with catkin_make]${NC}\n"
    mkdir -p ~/catkin_ws/src
    cd ~/catkin_ws/src
    catkin_init_workspace
    cd ~/catkin_ws/
    catkin_make
    source ${HOME}/catkin_ws/devel/setup.bash
    rospack profile
fi

printf "\n${YELLOW}[Cloning or Updating git repositories]${NC}\n"
cd ~/catkin_ws/src
if ! [ -d ~/catkin_ws/src/amp ]
    then
    git https://github.com/sypronamp/amp.git
else
    cd ~/catkin_ws/src/amp
    git pull
fi
cd ~/catkin_ws/

catkin_make

printf "\n${YELLOW}[AMP has been installed]${NC}\n"

