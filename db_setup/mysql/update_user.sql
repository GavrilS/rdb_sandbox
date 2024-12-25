-- Recreate user root so we can connect without using the sudo command in Ubuntu
-- SELECT User, Host FROM mysql.user;

-- DROP USER 'root'@'localhost';

-- CREATE USER 'root'@'localhost' IDENTIFIED BY ''; 

-- GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;

-- FLUSH PRIVILEGES;

-- Alternative way to simply update the user (can be an empty password or an actual value for password)
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '';