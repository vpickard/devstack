#!/bin/bash

#create sriov ports 
port1_id=$(neutron port-create multinet --name sriov_port1 --binding:vnic_type direct --device-owner nova-compute | grep "\ id\ " | awk '{ print $4 }')
port2_id=$(neutron port-create multinet --name sriov_port2 --binding:vnic_type direct --device-owner nova-compute | grep "\ id\ " | awk '{ print $4 }')
port3_id=$(neutron port-create multinet --name sriov_port3 --binding:vnic_type direct --device-owner nova-compute | grep "\ id\ " | awk '{ print $4 }')

#nova boot --poll --flavor m1.small --image centos7 --key-name admin_key --nic port-id=$port_id sriov-vm 
#nova boot --config-drive=true --poll --flavor m1.small --image centos7 --key-name admin_key --nic port-id=$port_id --user-data /opt/tools/centos.yaml sriov-centos
#nova boot --config-drive=true --poll --flavor m1.small.sriov --image centos7 --key-name admin_key --nic port-id=$port_id --user-data /opt/tools/centos.yaml sriov-centos

#sriov vm on .19
nova boot --config-drive=true --poll --flavor m1.small --image centos7 --nic port-id=$port1_id --availability-zone=nova:nfvsdn-09.oot.lab.eng.rdu2.redhat.com --key-name admin_key --user-data /opt/tools/centos.yaml sriov-vm1

sleep 5

#2nd sriov vm on .19
nova boot --config-drive=true --poll --flavor m1.small --image centos7 --nic port-id=$port3_id --availability-zone=nova:nfvsdn-09.oot.lab.eng.rdu2.redhat.com --key-name admin_key --user-data /opt/tools/centos.yaml sriov-vm3

sleep 5

#sriov vm on .30
nova boot --config-drive=true --poll --flavor m1.small --image centos7 --nic port-id=$port2_id --availability-zone=nova:nfvsdn-20.oot.lab.eng.rdu2.redhat.com --key-name admin_key --user-data /opt/tools/centos.yaml sriov-vm2

sleep 5

#vxlan vm on control .18
nova boot --config-drive=true --poll --flavor m1.small --image centos7 --nic net-id=$(neutron net-list | grep -w multinet | awk '{print $2}') --availability-zone=nova:control --key-name admin_key --user-data /opt/tools/centos.yaml vmvx01

#nova boot --poll --flavor m1.tiny --image $(glance image-list | grep 'uec\s' | awk '{print $2}' | tail -1) --nic net-id=$(neutron net-list | grep -w multinet | awk '{print $2}') vmvx01 --availability-zone=nova:control --key-name admin_key
sleep 5


nova get-vnc-console sriov-vm1 novnc
nova get-vnc-console sriov-vm2 novnc
nova get-vnc-console sriov-vm3 novnc
nova get-vnc-console vmvx01 novnc
