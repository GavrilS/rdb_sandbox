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

- alter tables

1. Add a column
   ALTER TABLE table_name ADD new_column_name column_definition
   [FIRTS | AFTER column_name]
   Example:
   ALTER TABLE test_table ADD description VARCHAR(62) AFTER name;
   ALTER TABLE test_table ADD tags VARCHAR(200) FIRST;

2. Add multiple columns
   ALTER TABLE table_name
   ADD new_column_name column_definition
   [FIRST | AFTER column_name],
   ADD new_column_name column_definition
   [FIRST | AFTER column_name]
   ...;
   Example:
   ALTER TABLE test_table
   ADD date DATE,
   ADD timestamp TIMESTAMP
   AFTER name;

3. Modify column in table
   ALTER TABLE table_name
   MODIFY column_name column_definition
   [FIRST | AFTER column_name];
   Example:
   ALTER TABLE test_table
   MODIFY date DATETIME
   FIRST;

4. Drop column in table
   ALTER TABLE table_name
   DROP COLUMN column_name;
   Example:
   ALTER TABLE test_table
   DROP COLUMN tags;

5. Rename column in table
   ALTER TABLE table_name
   CHANGE COLUMN old_name new_name
   column_definition
   [FIRST | AFTER column_name];
   Example:
   ALTER TABLE test_table
   CHANGE COLUMN date datetime
   DATETIME
   AFTER description;

6. Rename table
   ALTER TABLE table_name
   RENAME TO new_table_name;
   Example:
   ALTER TABLE test_table
   RENAME TO new_test_table;
