server-kvm
================


This role does

* install qemu, kvm and libvirt
* install vagrant (optional, use the `install_vagrant` flag)
* install nfs (optional, use the `install_nfsd` flag)
* install openvswitch with subnets (not implemented)

Nested virtualization is enabled by default. Disable using `kvm_enable_nested`.

See [`defaults/main.yml`](defaults/main.yml) for other variables.


To use
------------

For an example see [`tests/test.yml`](tests/test.yml)


To test
--------------

'''
cd tests
vagrant up
'''

It spins up a test machine, provisions it, and spin up a nested test machine. The test machine include an nfs shared folder.

The is a script called `checkSsh.sh` which checks if the new virtual machine is connectable using standard ssh keys.
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

For details go [here](https://docs.fedoraproject.org/en-US/quick-docs/using-nested-virtualization-in-kvm/) and [here](https://github.com/vagrant-libvirt/vagrant-libvirt/wiki)

I have added a script called [`kvm_sanity_check.sh`](files/kvm_sanity_check.sh) (that should be in PATH), to check for virtualization capability, modules and nesting parameter.
