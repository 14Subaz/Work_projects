#! /bin/bash

echo "##It's a if class script##"

systemctl status apache2 &>> /bin/null
VAR1=$(echo $?)
if [ $VAR1 -eq 0 ]; then
echo "##Apache server is Running##"
else
echo "Need to start the Apache Server"
sleep 3
systemctl start apache2 &>> /bin/null
echo "##Launching Apache Server##"
sleep 3
systemctl status apache2 &>> /bin/null
VAR2=$(echo $?)
if [ $VAR2 -eq 0 ]; then
echo "##Apache server is Launching Successfully##"
else
echo "##Some Problem with Starting Apache Server, Please contact admin##"       
fi  
fi