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

- temporary tables
  CREATE TEMPORARY TABLE table*name (
  column_1, column_2,..., table_constraints
  );
  CREATE TEMPORARY TABLE temp_table_name SELECT * FROM original*table_name LIMIT 0;
  DROP TEMPORARY TABLE table_name;
  Example:
  CREATE TEMPORARY TABLE temp_test_table SELECT * FROM my_test_table LIMIT 0;
  DROP TEMPORARY TABLE temp_test_table;

- copy tables
  CREATE TABLE IF NOT EXISTS new_table_name
  SELECT column_1, column_2, column_3
  FROM existing_table
  WHERE condition;

CREATE TABLE IF NOT EXISTS my_new_table LIKE my_existing_table;
INSERT my_new_table SELECT \* FROM my_existing_table;

Example:
CREATE TABLE IF NOT EXISTS new_test_tb
SELECT id, name, description
FROM my_test_table;

- Repair a table
  REPAIR [NO_WRITE_TO_BINLOG | LOCAL]
  TABLE tbl_name [, tbl_name] ...
  [QUICK] [EXTENDED] [USE_FIRM]

* Column operations:

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

- Views - virtual tables

* create a view
  CREATE [OR REPLACE] VIEW view_name AS
  SELECT columns
  FROM tables
  [WHERE conditions];

* update a view(without dropping it)
  ALTER VIEW view_name AS
  SELECT columns
  FROM table
  WHERE conditions;

* drop a view
  DROP VIEW [IF EXISTS] view_name;

# Table locking

- used mainly to solve concurency issues
- two types of locks - read and write
- InnoDB storage engine does not require table locking manually, because it already use row-level locking for its tables; all other storage engines use table locking in MySQL

* Test table locking:
  CREATE TABLE info_table (
  id INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(50) NOT NULL,
  Message VARCHAR(250) NOT NULL,
  PRIMARY KEY(id)
  );

  INSERT INTO info_table (name, message)  
   VALUES('Peter', 'Hi'),  
   ('Joseph', 'Hello'),  
   ('Mark', 'Welcome');

  SELECT \* FROM info_table;

  LOCK TABLE info_table READ;

  INSERT INTO info_table (name, message)  
   VALUES ('Suzi', 'Hi'); {This should be an error}

  LOCK TABLE info_table WRITE;
  INSERT INTO info_table (name, message)  
   VALUES ('Stephen', 'How R U');
  INSERT INTO info_table (name, message)  
  VALUES ('George', 'Welcome');

  SELECT \* FROM info_table;

- acquire table lock explicitly
  LOCK TABLES table_name [READ | WRITE],
  tab_name2 [READ | WRITE],...;
  Ex:
  LOCK TABLES info_table [READ | WRITE];

- release lock
  UNLOCK TABLES;

* Account Lock

- user account locking:
  CREATE USER account_name IDENTIFIED BY 'password' ACCOUNT LOCK; (lock during user acc creation)
  ALTER USER acc_name IDENTIFIED BY 'password' ACCOUNT LOCK; (lock existing user acc)

- user account unlock:
  ALTER USER [IF EXISTS] user_acc_name ACCOUNT UNLOCK;
