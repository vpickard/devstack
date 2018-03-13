#!/bin/bash

openstack server create vmvx1 --config-drive=true  --user-data /opt/tools/centos.yaml --flavor centos-3G --image centos7-vic --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute1 --key-name admin_key --security-group goPacketGo

#openstack server create vmvx1 --flavor m1.nano --image cirros-0.3.5-x86_64-disk --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute1 --key-name admin_key
sleep 5

openstack server create vmvx2 --config-drive=true  --user-data /opt/tools/centos.yaml --flavor centos-3G --image centos7-vic --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute2 --key-name admin_key --security-group goPacketGo

#openstack server create vmvx2 --flavor m1.nano --image cirros-0.3.5-x86_64-disk --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute2 --key-name admin_key

openstack server create vmvx3 --config-drive True --user-data /opt/devstack/centos.yaml --flavor centos-3G --image centos7-vic --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute1 --key-name admin_key --security-group goPacketGo

openstack server create vmvx4 --config-drive True --user-data /opt/devstack/centos.yaml --flavor centos-3G --image centos7-vic --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute2 --key-name admin_key --security-group goPacketGo

openstack server create vmvx5 --config-drive True --user-data /opt/devstack/centos.yaml --flavor centos-3G --image centos7-vic --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute1 --key-name admin_key --security-group goPacketGo

#openstack server create vmvx5 --flavor m1.nano --image cirros-0.3.5-x86_64-disk --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') --availability-zone=nova:compute1 --key-name admin_key --security-group goPacketGo

#sleep 5
#nova get-vnc-console vmvx1 novnc
#sleep 5
#nova get-vnc-console vmvx2 novnc
