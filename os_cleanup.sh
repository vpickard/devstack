#!/bin/bash

nova delete sriov-vm1
sleep 1
neutron port-delete sriov_port1
sleep 1
neutron subnet-delete mn-subnet
sleep 1
neutron net-delete multinet



