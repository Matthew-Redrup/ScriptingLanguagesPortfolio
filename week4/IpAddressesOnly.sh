#!/bin/bash

./IpInfo2.sh | sed -n '/IP Address:/ {
    p
    }'