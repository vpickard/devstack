#!/bin/bash

# create image
#glance image-create --name trusty --disk-format raw --container-format bare --visibility public --file /opt/devstack/trusty-server-cloudimg-amd64-disk1.img
#glance image-create --name centos7 --disk-format raw --container-format bare --visibility public --file /opt/devstack/CentOS-7-x86_64-GenericCloud-1608.raw
glance image-create --name centos7 --disk-format qcow2 --container-format bare --visibility public --file /opt/devstack/vic-centos7.0.qcow2

