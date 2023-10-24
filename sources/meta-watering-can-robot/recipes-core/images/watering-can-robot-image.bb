# Base this image on ros-image-world.bb
require ${COREBASE}/meta-ros/meta-ros-common/recipes-core/images/ros-image-world.bb

IMAGE_FEATURES += "ssh-server-openssh"
