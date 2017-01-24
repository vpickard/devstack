#!/bin/bash

nova aggregate-create sriov
nova aggregate-set-metadata sriov sriov=true
nova aggregate-create normal
nova aggregate-set-metadata normal sriov=false

nova aggregate-add-host sriov nfvsdn-09.oot.lab.eng.rdu2.redhat.com
nova aggregate-add-host normal control

nova flavor-create m1.small.sriov auto 2048 20 2
nova flavor-key m1.small.sriov set aggregate_instance_extra_specs:sriov=true


openstack flavor list -f csv|grep -v sriov|cut -f1 -d,| tail -n +2|  xargs -I% -n 1 nova flavor-key % set aggregate_instance_extra_specs:sriov=false



