# MySQL Server Database commands:

- create database
  CREATE DATABASE IF NOT EXISTS test_db
  [CHARACTER SET charset_name]
  [COLLATE collation_name];

- show databases/schemas
  SHOW DATABASES;
  SHOW CREATE DATABASE test_db;
  SHOW SCHEMAS;

- show databases using pattern matching \*
  SHOW DATABASES LIKE '%test%';
  SELECT schema_name FROM information_schema.schemata WHERE schema_name LIKE 'test%';

* % - 0, 1 or more characters

- drop databases
  DROP DATABASE IF EXISTS test_db;
  DROP SCHEMA IF EXISTS test_db;

- use database
  USE test_db;

- copy a database (three steps):

1. Create a new database
2. Store the data from the database we want to copy to an sql file; the file must end with .sql extension
3. Export all the database objects along with its data to copy using the 'mysqldump' tool and then import the file into the new database

CREATE DATABASE test_db_copy;
mysqldump -u root -p test_db > tmp/test_db.sql (this is done from outside mysql terminal to export the database objects)
mysql -u root -p test_db_copy < tmp/test_db.sql (this is importing the database objects to the copy database)
\*\* to test the change, login and list the tables:
use test_db_copy;
show tables;
