# Base this image on ros-image-world.bb
require ${COREBASE}/meta-ros/meta-ros-common/recipes-core/images/ros-image-sdktest.bb

IMAGE_FEATURES += "ssh-server-openssh"
