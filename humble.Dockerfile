################################################
# Build ros-base                               #
# (ROS2 image with default packages)           #
################################################
FROM osrf/ros:humble-desktop-full AS humble-base
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
# Build humble-dev                             #
################################################

FROM humble-base AS humble-dev
ENV DEBIAN_FRONTEND=noninteractive

RUN sudo apt-get update \
 &&  sudo apt-get install -y \
  python3-pip \ 
  libnlopt-dev \
  libnlopt-cxx-dev \
  ros-humble-xacro \
  ros-humble-joint-state-publisher \
  ros-humble-srdfdom \
  ros-humble-controller-interface \
  ros-humble-realtime-tools \
  ros-humble-control-toolbox \
  ros-humble-joint-state-publisher-gui \
  ros-humble-geometric-shapes \
  ros-humble-controller-manager \
  ros-humble-joint-trajectory-controller \
  ros-humble-ros-gz-sim \
  ros-humble-ros-gz-bridge \
  ros-humble-robot-localization \
  ros-humble-interactive-marker-twist-server \
  ros-humble-twist-mux \
  ros-humble-joy-linux \
  ros-humble-imu-tools \
  ros-humble-control-toolbox  \
  ros-humble-moveit-core \
  libpoco-dev \
  ros-humble-pinocchio \
  google-mock \
  ros-humble-ament-cmake-clang-format
  
#RUN  pip3 install toppra --break-system-packages


RUN sudo mkdir -p ${CODE_DIR} && \
   sudo chown -R ${USERNAME}:${USERNAME} ${CODE_DIR}


# Build libfranka
#RUN git clone --recursive https://github.com/frankaemika/libfranka --branch 0.10.0 && \
RUN git clone --recursive https://github.com/frankaemika/libfranka --branch 0.13.3 && \
    cd libfranka && \
    git submodule update && \
    mkdir build && cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTS=OFF .. && \
    cmake --build . && \
    cpack -G DEB && \
    sudo dpkg -i libfranka*.deb


# Get ready withr rosws workspace
RUN mkdir -p ${CODE_DIR}/rosws


# Make workspace
WORKDIR ${CODE_DIR}/rosws
