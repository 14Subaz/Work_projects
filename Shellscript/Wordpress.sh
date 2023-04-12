#! /bin/bash

sudo ip addr show | grep 192.168.

#PACKAGES= "apache2  \
#            ghostscript \
#            libapache2-mod-php \
#          mysql-server \
#         php \
#        php-bcmath \
#       php-curl \
#      php-imagick \
#    php-json \
#    php-mbstring \
#   php-mysql \
#  php-xml \
# php-zip"
#HOMEDIR="/srv/www"
#SOURCE="https://wordpress.org/latest.tar.gz"

##This executable shell scripts will deploy wordpress on your local machine##
echo "#########################################################"
echo "Hi this shell script help to up wordpress web page only on Ubuntu 20.04 LTS"
echo "########################################################"
echo "Operation Begins"
echo "########################################################"
echo "##What you will need##"
echo ">>A computer running Ubuntu Server 20.04 LTS"
echo ">>This guide will also show you how to configure a database for WordPress"
echo "########################################################"
echo "Let's Begin"
sudo apt update -y
echo "##Ubuntu Updates Installed Sucessfully##"
sudo apt install apache2 \
                 ghostscript \
                 libapache2-mod-php \
                 mysql-server \
                 php \
                 php-bcmath \
                 php-curl \
                 php-imagick \
                 php-intl \
                 php-json \
                 php-mbstring \
                 php-mysql \
                 php-xml \
                 php-zip -y
echo "##Packages Installed Sucessfully##"
sudo mkdir -p /srv/www
sudo chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www
cp /vagrant/wordpress.conf /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default
sudo systemctl reload apache2
mysql -u root -e 'create database wordpress;'
mysql -u root -e 'create user wordpress@localhost identified by "admin@123";'
mysql -u root -e 'grant all privileges on wordpress.* to wordpress@localhost with grant option;'
mysql -u root -e 'flush privileges;'
echo "##Database configured Sucessfully##"
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/admin@123/' /srv/www/wordpress/wp-config.php
echo "########################################################"
echo "##Everything Installed Sucessfully##"
echo "########################################################"
echo "##Thanks by Subaz.dev##"
echo "########################################################"






