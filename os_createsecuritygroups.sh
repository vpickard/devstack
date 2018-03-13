#!/bin/bash
openstack security group create goPacketGo
openstack security group rule create goPacketGo --ingress --ethertype IPv4 --dst-port 1:65535 --protocol tcp
openstack security group rule create goPacketGo --egress --ethertype IPv4 --dst-port 1:65535 --protocol tcp
openstack security group rule create goPacketGo --ingress --ethertype IPv4 --dst-port 1:65535 --protocol udp
openstack security group rule create goPacketGo --egress --ethertype IPv4 --dst-port 1:65535 --protocol udp
openstack security group rule create goPacketGo --ingress --ethertype IPv4 --dst-port 1:65535 --protocol icmp
openstack security group rule create goPacketGo --egress --ethertype IPv4 --dst-port 1:65535 --protocol icmp
