# Base this image on core-image-minimal.bb
include recipes-core/images/core-image-minimal.bb

IMAGE_FEATURES += "ssh-server-openssh"