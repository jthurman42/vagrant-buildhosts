#!/bin/bash

BASE_DIR=/home/vagrant/rpmbuild
LOCAL_DIRS="BUILD SOURCES SPECS"

# These will be mounted from the host
HOST_MOUNT=/vagrant
HOST_DIRS="RPMS SRPMS"


# Configure Local directories
[ -d ${BASE_DIR} ] || mkdir -p ${BASE_DIR}

for d in ${LOCAL_DIRS}; do
  [ -d ${BASE_DIR}/$d ] || mkdir ${BASE_DIR}/$d
  chown -R vagrant.vagrant ${BASE_DIR}/$d
done


# Link these to the Vagrant exports
for d in ${HOST_DIRS}; do
  if [ -d ${HOST_MOUNT}/$d ]; then
    # If the host actually has these directories...
    # Nuke an existing directory, we will symlink it
    [ -d ${BASE_DIR}/$d ] && rm -rf ${BASE_DIR}/$d
    [ -L ${BASE_DIR}/$d ] || ln -s ${HOST_MOUNT}/$d ${BASE_DIR}/$d
  else
    # Directory doesn't exist on the host, create it so we can still work...
    [ -d ${BASE_DIR}/$d ] || mkdir ${BASE_DIR}/$d
    chown -R vagrant.vagrant ${BASE_DIR}/$d
  fi
done


# Setup RPM Macro stuff
echo "%_topdir ${BASE_DIR}" > /home/vagrant/.rpmmacros

