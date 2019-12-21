#!/bin/bash
  
sudo apt-get -y update

sudo apt-get -y install apache2
 
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password rootpass'
sudo debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password rootpass'
sudo apt-get -y install mysql-server libapache2-mod-auth-mysql php5-mysql
 
sudo apt-get -y install php5 libapache2-mod-php5 php5-mcrypt
