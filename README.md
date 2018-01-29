# AMP

1. First follow use this quick install patch by chrisl8 to install ROS and Arlobot files on the robot computer
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/chrisl8/ArloBot/kinetic/setup-kinetic.sh)
```
2. Then run this patch to install AMP on the robot Computer
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/sypronamp/amp/master/install_amp.sh)
```
3. First follow use this quick install patch by chrisl8 to install ROS and Arlobot files on the Workstation
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/chrisl8/ArloBot/kinetic/workstation-kinetic.sh)
```
4. Then run this patch to install AMP on the Workstation Computer
```
bash <(wget -qO- --no-cache https://raw.githubusercontent.com/sypronamp/amp/master/install_amp.sh)
```
5. After that unzip Arlo_Files zip and do the following
- copy .arlobot to Home
- copy arlobot & arlobot_apps & arlobot_viz to catkin_ws/src/ArloBot/src
- copy PropellerCodeForArloBot catkin_ws/src/ArloBot/


