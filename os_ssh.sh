#!/bin/bash

vmip=$1

if [[ $vmip == 10.100.5.* ]]; then
    net="multinet"
elif [[ $vmip == 10.100.6.* ]]; then
    net="vx-net1"
else
    echo "Error: Network $vmip not known to $0"
    exit
fi

ns=qdhcp-$(neutron net-list | grep -w $net | awk '{print $2}')
#ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /home/odl/.ssh/id_rsa cirros@$1
#sudo ip netns exec qdhcp-1082db45-5c34-47d5-9c1e-de9314aa1b01 ping 10.100.5.4

sudo ip netns exec $ns ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /opt/stack/.ssh/id_rsa admin@$vmip
