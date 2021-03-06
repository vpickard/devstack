#!/bin/bash

#neutron net-create multinet --segments type=dict list=true provider:physical_network=physnet1,provider:segmentation_id=2901,provider:network_type=vlan provider:physical_network='',provider:segmentation_id=1500,provider:network_type=vxlan

#neutron net-create multinet --segments type=dict list=true provider:physical_network=physnet1,provider:segmentation_id=2901,provider:network_type=vlan 

neutron net-create multinet --segments type=dict list=true provider:physical_network='',provider:segmentation_id=1500,provider:network_type=vxlan provider:physical_network=physnet1,provider:segmentation_id=2901,provider:network_type=vlan 

neutron net-create multinet1 --segments type=dict list=true provider:physical_network='',provider:segmentation_id=1501,provider:network_type=vxlan provider:physical_network=physnet1,provider:segmentation_id=2902,provider:network_type=vlan 

neutron subnet-create multinet --allocation-pool start=10.100.5.2,end=10.100.5.254 --name mn-subnet --dns-nameserver 8.8.8.8 10.100.5.0/24
neutron subnet-create multinet1 --allocation-pool start=10.100.6.2,end=10.100.6.254 --name mn-subnet --dns-nameserver 8.8.8.8 10.100.6.0/24


