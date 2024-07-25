# MySQL Server User commands

- create user
  CREATE USER [IF NOT EXISTS] account_name IDENTIFIED BY 'password';
  account_name = 'username@hostname' or 'username@%' if we want to skip the hostname
  example: create user if not exists test@localhost identified by 'test';

- show users
  select user from mysql.user;

# User privileges:

ALL PRIVILEGES: all privileges
CREATE: create databases and tables
DROP: drop databases and tables
DELETE: delete rows froma specific table
INSERT: insert new rows in specific table
SELECT: read a database
UPDATE: update table rows

- grant privileges to a new user
  GRANT ALL PRIVILEGES ON \*.\* TO test@localhost;

- flush privileges for the changes to take effect immediately
  FLUSH PRIVILEGES;

- see privileges for a user
  SHOW GRANTS for test@localhost;
