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

The is a script called `checkSsh.sh` which checks if the new virtual machine is connecable using standard ssh keys.
This is needed to access libvirt.


About virtualization
-----------------

For the host to be able to do nested virtualisations, it need to be enabled...

```
$ cat /sys/module/kvm_intel/parameters/nested
N
```

This means that nested virtualization will not work properly.

You will get something like `invalid argument: could not find capabilities for domaintype=kvm` when using vagrant-libvirt.

For details go [ghere](https://docs.fedoraproject.org/en-US/quick-docs/using-nested-virtualization-in-kvm/) and [here](https://github.com/vagrant-libvirt/vagrant-libvirt/wiki)

I have added a script called `kvm_sanity_check.sh` (that should be in PATH), to check for virtualization capability, modules and nesting parameter.
