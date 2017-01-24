#!/bin/bash

neutron net-create vx-net0 --provider:network_type vxlan --provider:segmentation_id 1500
neutron subnet-create vx-net0 --allocation-pool start=10.100.5.2,end=10.100.5.49 --name vx-subnet0 --dns-nameserver 8.8.8.8 10.100.5.0/24

# sr-iov
neutron net-create nfv_sriov --provider:network_type vlan --provider:physical_network physnet1
neutron subnet-create --name nfv_subnet_sriov --gateway 10.100.5.1 --allocation-pool start=10.100.5.50,end=10.100.5.100 nfv_sriov 10.100.5.0/24

