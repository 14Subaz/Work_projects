#! /bin/bash
echo "#########################################################################"
echo "This script will run and deploy whatever the website in your local server"
echo "#########################################################################"
echo $0
echo "Enter the Website templetes url would like to deploy"
echo $1
echo "Enter the templete file name after download done"
echo $2
echo "Enter the templete file name after unzip done"
echo $3
sudo yum update -y
sudo yum install httpd wget unzip -y
systemctl start httpd
systemctl enable httpd
cd /tmp/
wget $1 
unzip -o $2
cp -r $3/* /var/www/html/
systemctl restart httpd

https://www.free-css.com/assets/files/free-css-templates/download/page289/zon.zip zon.zip zon-html