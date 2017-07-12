#!/bin/bash

neutron l2-gateway-create gw1 --tenant_id $(openstack project list | grep '\sadmin' | awk '{print $2}')   --device name=hwvtep,interface_names="eth2;eth3"
sleep 5
neutron l2-gateway-connection-create gw1 multinet --default-segmentation-id 2901
sleep 5
neutron l2-gateway-connection-create gw1 multinet1 --default-segmentation-id 2902

