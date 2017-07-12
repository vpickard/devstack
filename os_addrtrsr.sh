#!/bin/bash

neutron router-create ext-rtr
sleep 5
neutron router-interface-add ext-rtr mn-subnet

