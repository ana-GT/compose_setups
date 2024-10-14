#!/bin/bash

mkdir src 
git clone git@github.com:ros2-rust/ros2_rust.git src/ros2_rust
vcs import src < src/ros2_rust/ros2_rust_rolling.repos
popd
