#! /bin/bash

echo "Starting the MySQL service"
sudo service mysql start
echo "==========================="

echo "Check the status of the MySQL service"
sudo service mysql status
echo "==========================="

echo "Check the network status of the MySQL service"
sudo ss -tap | grep mysql
echo "==========================="

# If the service is not running properly we can restart it with the following command
# sudo service mysql restart

# For troubleshooting problems we can use the systemd journal
# sudo journalctl -u mysql

# Update the user so we can connect with root from all users
sudo mysql -u $user -p $password < ./update_user.sql