#!/bin/bash

sudo apt install mysql-server

echo "==========================="
echo "Check the status of the MySQL service"
sudo service mysql status

echo "==========================="
echo "Check the network status of the MySQL service"
sudo ss -tap | grep mysql

# If the service is not running properly we can restart it with the following command
# sudo service mysql restart

# For troubleshooting problems we can use the systemd journal
# sudo journalctl -u mysql
