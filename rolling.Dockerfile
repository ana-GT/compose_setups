################################################
# Build ros-base                               #
# (ROS2 image with default packages)           #
################################################
FROM osrf/ros:rolling-desktop-full AS rolling-base
ENV DEBIAN_FRONTEND=noninteractive

#RUN pip3 install cfdp pymongo tornado

# Switch to bash shell
SHELL ["/bin/bash", "-c"]


# Create a brash user
#ENV USERNAME ubuntu
#ENV HOME_DIR=/home/${USERNAME}
ENV CODE_DIR=/code

# Dev container arguments
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

# Create new user and home directory
#RUN groupadd --gid ${USER_GID} ${USERNAME} \
#&& useradd --uid ${USER_UID} --gid ${USER_GID} --create-home ${USERNAME} \
#&& echo ${USERNAME} ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/${USERNAME} \
#&& chmod 0440 /etc/sudoers.d/${USERNAME} \
#&& mkdir -p ${CODE_DIR} \
#&& chown -R ${USER_UID}:${USER_GID} ${CODE_DIR}

RUN mkdir -p ${CODE_DIR} \
  && chown -R ${USER_UID}:${USER_GID} ${CODE_DIR}

# Swith to username
#USER ${USERNAME}
WORKDIR ${CODE_DIR}


################################################
# Build rolling-dev                             #
################################################

FROM rolling-base AS rolling-dev
ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get update \
 &&  sudo apt-get install -y \
  python3-pip \ 
  ros-rolling-geometric-shapes \
  ros-rolling-octomap-msgs \
  ros-rolling-srdfdom \
  ros-rolling-gtest-vendor \
  ros-rolling-joint-state-publisher-gui \
  ros-rolling-control-msgs \
  ros-rolling-controller-manager-msgs \
  ros-rolling-ament-cmake-google-benchmark \
  ros-rolling-launch-ros \
  ros-rolling-joint-trajectory-controller \
  ros-rolling-ompl \
  ros-rolling-angles \
  ros-rolling-controller-manager \
  ros-rolling-hardware-interface \
  ros-rolling-joint-state-broadcaster \ 
  ros-rolling-moveit \
  ros-rolling-ros2-controllers \
  ros-rolling-ros-gz \
  libboost-filesystem-dev \
  libnlopt-dev \
  libnlopt-cxx-dev \
  libnlopt-cxx0 \
  libnlopt0 \
  libfcl-dev \
  libbenchmark-dev \
  libpcl-dev \
  xterm \
  gdb

RUN  pip3 install toppra --break-system-packages


RUN sudo mkdir -p ${CODE_DIR} && \
   sudo chown -R ${USERNAME}:${USERNAME} ${CODE_DIR}


# Get ready withr rosws workspace
RUN mkdir -p ${CODE_DIR}/rosws


# Make workspace brash
WORKDIR ${CODE_DIR}/rosws
