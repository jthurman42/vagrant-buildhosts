#!/bin/bash

# Configure directories
[ -d /home/vagrant/rpmbuild ] || mkdir -p /home/vagrant/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
chown -R vagrant.vagrant /home/vagrant/rpmbuild

# Setup RPM Macro stuff
echo '%_topdir %(echo $HOME)/rpmbuild' > /home/vagrant/.rpmmacros

