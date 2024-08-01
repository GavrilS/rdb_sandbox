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
  DESC test_table;
  SHOW COLUMNS FROM my_test_table;
  SHOW COLUMNS FROM test_db.my_test_table;
  SHOW FULL TABLES;
  SHOW TABLES IN test_db;
  SHOW TABLES FROM test_db;
  EXPLAIN SELECT \* FROM my_test_table;

  - SHOW TABLES LIKE pattern; or SHOW TABLES WHERE expression; Example:
    SHOW TABLES LIKE "%test%";

  SHOW TABLES WHERE table_type = "VIEW";\*\*

- alter tables

- truncate table - deletes the entire data in a table without removing the table structure; limitations:

* cannot use WHERE clause;
* cannot rollback deleted data;
* the command doesn't work when a foreign key is referencing the table or it participates in an indexed view;
* doesn't fire DELETE triggers associated with the table because it does not operate on individual rows
  ** Syntax:
  TRUNCATE [TABLE] table_name;
  ** Example:
  truncate table my_test_table;
* How to Truncate a table with a foreign key reference:
  SET FOREIGN_KEY_CHECKS=0;
* To enable foreign key checks:
  SET FOREIGN_KEY_CHECKS=1;

- drop tables
  DROP [TEMPORARY] TABLE [IF EXISTS] table_name [RESTRICT | CASCADE];

* TEMPORARY - delete temporary tables only
* RESTRICT | CASCADE - optional statements that have no impact on this statement; they are included in the syntax for future versions

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
