#!/bin/sh
sudo apt-get update
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get -y install mysql-server
sudo mysql -u root --password=root < script.sql
sudo service mysql stop
sudo chmod 777 /etc/mysql/my.cnf
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
sudo chmod 664 /etc/mysql/my.cnf
sudo service mysql start