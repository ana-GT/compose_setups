#!/bin/bash

MIGRATION_BRANCH=migration-task2   
pushd src
git clone -b $MIGRATION_BRANCH git@bitbucket.org:traclabs/trac_ik_dev.git trac_ik
git clone -b humble git@github.com:traclabs/sigslot.git
git clone -b $MIGRATION_BRANCH git@bitbucket.org:traclabs/craftsman_core.git craftsman_core
git clone -b $MIGRATION_BRANCH git@bitbucket.org:traclabs/craftsman_navigation_tools.git craftsman_navigation_tools
git clone -b humble/execution_interface git@bitbucket.org:traclabs/robot_interaction_tools_dev.git robot_interaction_tools
git clone -b main git@github.com:frankaemika/franka_description franka_description
git clone -b $MIGRATION_BRANCH git@bitbucket.org:traclabs/tracbot_application_tools.git
git clone -b $MIGRATION_BRANCH git@github.com:traclabs/yumi.git
git clone -b master git@github.com:ros-controls/gz_ros2_control.git
git clone -b rolling git@github.com:UniversalRobots/Universal_Robots_ROS2_Description.git universal_robots_ros2_description
git clone -b ros2 git@github.com:UniversalRobots/Universal_Robots_ROS2_GZ_Simulation.git universal_robots_ros2_gz_simulation
git clone -b main git@github.com:RoverRobotics/roverrobotics_ros2.git roverrobotics_ros2
popd
