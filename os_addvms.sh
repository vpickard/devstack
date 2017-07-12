#!/bin/bash

nova boot --poll --flavor m1.nano --image $(nova image-list | grep 'uec\s' | awk '{print $2}' | tail -1) --nic net-id=$(neutron net-list | grep -w vx-net | awk '{print $2}') vmvx1 --availability-zone=nova:odl31 --key-name admin_key
sleep 5

# create sr-iov port on odl32
#port_id =$(neutron --os-project-name admin port-create physnet1 --name physnet-vf1 --binding:vnic-type direct) | grep "\ id\ " | awk '{ print $4 }'

# get sr-iov port id from port already created
port_id = $(neutron --os-project-name admin port-show physnet1-vf1) | grep "\ id\ " | awk '{print $4}'

nova boot --poll --flavor m1.nano --image $(nova image-list | grep 'uec\s' | awk '{print $2}' | tail -1) --nic port-id=$port_id --availability-zone=nova:odl32 --key-name admin_key vmvx2
sleep 5
nova get-vnc-console vmvx1 novnc
nova get-vnc-console vmvx2 novnc
