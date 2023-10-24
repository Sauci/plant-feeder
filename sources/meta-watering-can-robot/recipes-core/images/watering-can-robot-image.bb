# Base this image on ros-image-world.bb
require ${COREBASE}/meta/recipes-core/images/core-image-base.bb

IMAGE_FEATURES += "ssh-server-openssh"

inherit ros_distro_${ROS_DISTRO}
inherit ${ROS_DISTRO_TYPE}_image

#IMAGE_ROOTFS_SIZE = "8192"

IMAGE_INSTALL:append:ros2-distro = " ros-core"

