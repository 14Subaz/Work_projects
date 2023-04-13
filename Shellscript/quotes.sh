#! /bin/bash
echo "###################################"
echo "##monitor sheet##"
echo "###################################"
FREE_RAM=$(free -m | grep Mem | awk '{ print $4 }')
date
echo "Your systems free RAM is $FREE_RAM MB"
