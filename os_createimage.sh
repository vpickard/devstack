#!/bin/bash

#create flavor for centos 7 vms.
openstack flavor create --ram 2048 --disk 4 --swap 2000 cirros

# create image
#glance image-create --name trusty --disk-format raw --container-format bare --visibility public --file /opt/devstack/trusty-server-cloudimg-amd64-disk1.img
#glance image-create --name centos7 --disk-format raw --container-format bare --visibility public --file /opt/devstack/CentOS-7-x86_64-GenericCloud-1608.raw
#glance image-create --name centos7 --disk-format qcow2 --container-format bare --visibility public --file /opt/devstack/vic-centos7.0.qcow2
#openstack image create --disk-format qcow2 --container-format bare --public --file /opt/devstack/vic-centos7-ssh.qcow2 centos7
#openstack image create --disk-format qcow2 --container-format bare --public --file /opt/devstack/centos7-3G.qcow2 centos7-vic
openstack image create --disk-format qcow2 --container-format bare --public --file /root/vic/images/cirros-0.4.0-x86_64-disk.img cirros

