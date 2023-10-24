# Base this image on core-image-minimal.bb
include recipes-core/images/core-image-base.bb

IMAGE_FEATURES += "ssh-server-openssh"
IMAGE_INSTALL:append = " ros-image-world"
