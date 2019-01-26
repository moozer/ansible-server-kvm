#!/bin/bash

echo "We rely on either kvm_intel or kvm_amd."
echo "This focusses on intel"
echo ""

echo "Checking CPU capability"
if grep -i vmx /proc/cpuinfo  > /dev/null; then
	echo "* ok  : CPU virtualization extensions enabled"
else
	echo "* bad : CPU virtualization extensions *not* available"
	echo "This might be related to the chips being AMD or no BIOS misconfiguration or something else"
	echo "Skipping other tests"
	exit 2
fi


echo "Check for kernel module"
if lsmod | grep kvm_intel > /dev/null; then
	echo "* ok  : kvm_intel module is loaded"
else
	echo "* bad : kvm_intel module *not* loaded"
	echo "Skipping other tests"
	exit 1
fi

echo "Check for nested parameter"
if grep Y /sys/module/kvm_intel/parameters/nested > /dev/null; then
	echo "* ok  : nested KVM is enabled in the module"
else
	echo "* bad : nested KVM *not* enabled in the module"
fi
