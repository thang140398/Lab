#!/bin/bash

echo "Removing old ovs configuration."
sudo /etc/init.d/openvswitch-switch stop
sudo kill cd /usr/local/var/run/openvswitch && cat ovsdb-server.pid ovs-vswitchd.pid
sudo rm -rf /usr/local/var/run/openvswitch
sudo mkdir -p /usr/local/var/run/openvswitch
sudo rm -rf /usr/local/etc/openvswitch
sudo mkdir -p /usr/local/etc/openvswitch
sudo rm -rf /var/run/openvswitch
sudo mkdir -p /var/run/openvswitch
sudo rm -rf /etc/openvswitch
sudo mkdir -p /etc/openvswitch
sudo rm -rf /var/log/openvswitch
sudo mkdir -p /var/log/openvswitch
sudo rmmod openvswitch
sudo rmmod gre
sudo rmmod vxlan
sudo rmmod libcrc32c
sudo rmmod openvswitch
sudo dpkg --force-all --purge openvswitch-switch
sudo dpkg --force-all --purge openvswitch-common
sudo dpkg --force-all --purge openvswitch-datapath-dkms
sudo rm /tmp/ovsdb.txt
touch /tmp/ovsdb.txt
sudo rm /tmp/vswitch.txt
touch /tmp/vswitch.txt
#git clone https://github.com/openvswitch/ovs.git
#git clone https://github.com/yyang13/ovs_nsh_patches.git
wget https://www.openvswitch.org/releases/openvswitch-2.14.0.tar.gz
tar -xvf openvswitch-2.14.0.tar.gz
rm openvswitch-2.14.0.tar.gz
cd openvswitch-2.14.0
make clean
./boot.sh
./configure --with-linux=/lib/modules/uname -r/build
sudo make uninstall
sudo apt-get install -y build-essential
sudo apt-get install -y fakeroot
sudo apt-get install -y debhelper
sudo apt-get install -y autoconf
sudo apt-get install -y automake
sudo apt-get install -y libssl-dev
sudo apt-get install -y bzip2
sudo apt-get install -y openssl
sudo apt-get install -y graphviz
sudo apt-get install -y python-all
sudo apt-get install -y procps
sudo apt-get install -y python-qt4
sudo apt-get install -y python-zopeinterface
sudo apt-get install -y python-twisted-conch
sudo apt-get install -y libtool
sudo apt-get install -y dh-autoreconf
sudo apt-get install -y python3-sphinx
sudo apt-get install -y libelf-dev
sudo apt install -y python3-all python3-twisted python3-zope.interface libunbound-dev libunwind-dev

echo "Checking Build Dependencies."
sudo dpkg-checkbuilddeps
if [ $? -gt 0 ]; then
echo "ERROR:Build Dependencies not met."
exit 1
fi

sudo apt-get install -y dh-python

echo "Creating Debian Packages."
rm ../libopenvswitch*.deb
rm ../openvswitch-.deb
rm ../python-openvswitch.deb
DEB_BUILD_OPTIONS='parallel=8 nocheck' fakeroot debian/rules binary
if [ $? -gt 0 ]; then
echo "ERROR:Creating Debian packages failed."
exit 1
fi

echo "Installing kernel module using dkms."
sudo apt-get install -y linux-headers-uname -r
sudo apt-get install -y dkms
sudo dpkg --install ../openvswitch-datapath-dkms*
if [ $? -gt 0 ]; then
echo "ERROR:Installing openvswitch kernel module failed."
exit 1
fi

echo "Installing openvswitch userland packages."
sudo dpkg --install ../libopenvswitch*
sudo dpkg --install ../openvswitch-common*
sudo dpkg --install ../openvswitch-switch*
if [ $? -gt 0 ]; then
echo "ERROR:Installing openvswitch userland packages failed."
exit 1
fi

sudo /etc/init.d/openvswitch-switch restart

sudo lsmod | grep -i open
sudo update-rc.d -f openvswitch-switch remove
sudo update-rc.d openvswitch-switch defaults
sudo ovs-vsctl show

echo "Install Complete!"
