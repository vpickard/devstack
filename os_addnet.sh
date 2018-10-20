#!/bin/bash

openstack network create --provider-network-type vxlan --provider-segment 1500 vx-net
sleep 5
openstack subnet create --network vx-net --subnet-range 10.100.5.0/24 vx-subnet
