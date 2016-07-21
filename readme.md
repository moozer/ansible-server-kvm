server-kvm
================


This role does

* install qemu, kvm and libvirt
* install vagrant (optional)
* install openvswitch with subnets (not implemented)


To use
------------

For an example see `tests/test.yml`


To test
--------------

'''
cd tests
vagrant up
'''

It spins up a test machine, provisions it, and spin up a nested test machine.
