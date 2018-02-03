# AMP

**#Robot Computer**

1. Use this quick install patch by chrisl8 to install ROS and Arlobot Packages
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/chrisl8/ArloBot/kinetic/setup-kinetic.sh)
```
2. Then run this patch to install AMP Packages
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/sypronamp/amp/master/install_amp.sh)
```
3. After that unzip Arlo_Files zip and do the following
```
- copy .arlobot to Home
- copy arlobot & arlobot_apps & arlobot_viz to catkin_ws/src/ArloBot/src
- copy PropellerCodeForArloBot catkin_ws/src/ArloBot/
```
**#Workstation Computer**

1. Use this quick install patch by chrisl8 to install ROS and Arlobot files on the 
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/chrisl8/ArloBot/kinetic/workstation-kinetic.sh)
```
2. Then run this patch to install AMP on the Workstation Computer
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/sypronamp/amp/master/install_amp.sh)
```

