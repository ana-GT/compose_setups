
Pre-requisites
===============
Tested on ROS2 Jazzy, Ubuntu 24.04.

Build workspace
================

1. Clone this repository:
   ```
   cd ~
   git clone git@github.com:ana-GT/compose_setups.git reachability_ws
   cd reachability_ws
   ```
2. Clone the necessary packages, ignore some packages that are not needed:
   ```
   ./scripts/clone_rosws.sh
   ./scripts/ignore.sh
   ```
3. Build:
   ```
   source /opt/ros/jazzy/setup.bash
   colcon build --symlink-install
   ```



Docker build
==============
Docker compose setups to test a variety of scenarios, such as ROS2 testing of
our reachability package.

1. Clone repository

   ``` 
   cd ~
   git clone git@github.com:ana-GT/compose_setups.git
   cd compose_setups
   ```
2. Build image, then clone repos and build them:

   ```
   ./scripts/build_images.sh
   ./scripts/clone_rosws.sh
   ./scripts/build_rosws.sh
   ```
   
# Run things

See README in [reachability_tools](https://github.com/ana-gt/reachability_tools)
   


