#!/bin/bash

net_info="$(ip address)"

addresses=$(echo "$net_info" | sed -n '/inet / {
    s/inet/IP Address:/
    s/netmask/\n\t\tSubnet Mask:/
    s/brd/\n\t\tBroadcast Address/
    p
    }')

    echo -e "The IP addresses on this computer are: \n$addresses"