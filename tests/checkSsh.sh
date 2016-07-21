#!/bin/sh

echo checks the ordinary ssh connection.

echo checking using vagrant parameters
vagrant ssh-config > vagrantsshconfig
ssh -F vagrantsshconfig default echo "- SSH with vagrant config works"

echo checking using user ssh parameters
IP=$(vagrant ssh-config | grep HostName | cut -d ' ' -f 4)
ssh vagrant@$IP echo "- SSH with user config works"

