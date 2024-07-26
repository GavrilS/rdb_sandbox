# MySQL Server User commands

- create user
  CREATE USER [IF NOT EXISTS] account_name IDENTIFIED BY 'password';
  account_name = 'username@hostname' or 'username@%' if we want to skip the hostname
  example: create user if not exists test@localhost identified by 'test';

- show users
  select user from mysql.user;

- show more information on the user table
  desc user;
  select user, host, account_locked, password_expired from user;

- show current user
  select user();
  select current_user();

- show current logger user
  select user, host, db, command from information_schema.processlist;

- update user password 1
  use mysql;
  update user set authentication_string='test' where user = 'test' and host = 'localhost';
  flush privileges;

- update user password 2
  ALTER USER test@localhost IDENTIFIED BY 'test123';

- drop user/s
  drop user test@localhost;
  drop user test@localhost,test2@localhost;

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
