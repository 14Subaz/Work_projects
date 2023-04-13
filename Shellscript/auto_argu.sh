#! /bin/bash

PACKAGES="apache2 \
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
        php-zip"
FROMSOURCE="https://wordpress.org/latest.tar.gz"
TODIR="/srv/www"
echo "########################################"
echo "##Wordpress launching script running##"
echo "########################################"
apt-get update -y
echo "########################################"
echo "##Your linux update successfully##"
echo "########################################"
sudo apt install $PACKAGES -y
echo "########################################"
echo "##Prerequities installed##"
echo "########################################"
sudo mkdir -p $TODIR
sudo chown www-data: $TODIR
curl $FROMSOURCE | sudo -u www-data tar zx -C $TODIR
cp /vagrant/wordpress.conf /etc/apache2/sites-available/wordpress.conf
sudo a2ensite wordpress
sudo a2enmod rewrite
sudo a2dissite 000-default
sudo mysql --version
sudo mysql -u root -e 'create database wordpress;'
sudo mysql -u root -e 'CREATE USER wordpress@localhost IDENTIFIED BY "admin@123";'
sudo mysql -u root -e 'grant all privileges on *.* to wordpress@localhost;'
sudo mysql -u root -e 'flush privileges;'
sudo service mysql start
sudo -u www-data cp /srv/www/wordpress/wp-config-sample.php /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/database_name_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/username_here/wordpress/' /srv/www/wordpress/wp-config.php
sudo -u www-data sed -i 's/password_here/admin@123/' /srv/www/wordpress/wp-config.php
sudo systemctl reload apache2