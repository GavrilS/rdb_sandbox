# MySQL Server Table commands

- create table - the command requires 3 things:

1. Name of the tables
2. Name of fields
3. Defitions for each field
   Example:
   CREATE TABLE IF NOT EXISTS test_table(
   id int NOT NULL AUTO_INCREMENT,
   name varchar(45) NOT NULL,
   PRIMARY KEY(id)
   );

- show tables
  SHOW TABLES;
  DESCRIBE test_table;
