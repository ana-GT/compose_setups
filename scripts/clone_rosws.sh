#!/bin/bash

mkdir src
pushd src
git clone -b rolling-devel git@bitbucket.org:traclabs/trac_ik.git trac_ik
git clone -b humble-devel git@github.com:ana-gt/placer.git
git clone -b humble-devel git@github.com:pal-robotics/pmb2_robot.git
git clone -b humble-devel git@github.com:pal-robotics/tiago_robot.git
git clone -b humble-devel git@github.com:pal-robotics/hey5_description.git
git clone -b humble-devel git@github.com:pal-robotics/pal_hey5.git
git clone -b humble-devel git@github.com:pal-robotics/pal_gripper.git
git clone -b humble-devel git@github.com:pal-robotics/pal_urdf_utils.git
git clone -b foxy-devel git@github.com:pal-robotics/tiago_description_calibration.git
git clone -b humble-devel git@github.com:pal-robotics/tiago_moveit_config.git
git clone -b master git@github.com:pal-robotics/launch_pal.git
git clone -b humble git@github.com:frankaemika/franka_ros2.git
git clone -b main git@github.com:frankaemika/franka_description.git
git clone -b galactic-devel git@github.com:sensible-robotics/fetch_ros.git
git clone -b galactic-devel git@github.com:traclabs/yumi.git
git clone -b devel git@github.com:ana-GT/reachability_tools.git
git clone -b foxy-devel git@github.com:pal-robotics/backward_ros.git
git clone -b humble-devel git@github.com:husky/husky.git
popd
