- Union operator - combine 2 or more result sets from multiple select statements into a single result set
  Example syntax:
  SELECT column_list UNION [DISTINCT | ALL] SELECT column_list UNION [DISTINCT | ALL] SELECT cl ...
  Example:
  DROP TABLE IF EXISTS t1;
  DROP TABLE IF EXISTS t2;
  CREATE TABLE t1 (
  id INT PRIMARY KEY
  );
  CREATE TABLE t2 (
  id INT PRIMARY KEY
  );
  INSERT INTO t1 VALUES (1), (2), (3);
  INSERT INTO t2 VALUES (2), (3), (4);
  Ex: combine result sets returned from t1 and t2
  SELECT id FROM t1 UNION SELECT id FROM t2;
  SELECT id FROM t1 UNION ALL SELECT id FROM t2;
  Practical examples:
  SELECT firstName, lastName FROM employees UNION SELECT contactFirstName, contactLastName
  FROM customers;
  SELECT CONCAT(firstName, ' ', lastName) fullname FROM employees UNION SELECT
  CONCAT(contactFirstName, ' ', contactLastName) FROM customers;
  SELECT CONCAT(firstName, ' ', lastName) fullname FROM employees UNION SELECT
  CONCAT(contactFirstName, ' ', contactLastName) FROM customers ORDER BY fullname;
  SELECT CONCAT(firstName, ' ', lastName) fullname, 'Employee' AS contactType FROM employees
  UNION SELECT CONCAT(contactFirstName, ' ', contactLastName), 'Customer' AS contactType
  FROM customers;
  SELECT CONCAT(firstName, ' ', lastName) fullname, 'Employee' AS contactType FROM employees
  UNION SELECT CONCAT(contactFirstName, ' ', contactLastName), 'Customer' AS contactType
  FROM customers ORDER BY fullname;

- Except operator - find the set difference between two sets of data
  Syntax: query1 EXCEPT [DISTINCT | ALL] query2;
  SELECT id FROM t1 EXCEPT SELECT id FROM t2;
  SELECT firstName, lastName FROM employees EXCEPT SELECT contactFirstName, contactLastName
  FROM customers;
  SELECT firstName FROM employees EXCEPT SELECT contactFirstName FROM customers;
  SELECT firstName FROM employees EXCEPT SELECT contactFirstName FROM customers ORDER BY firstName;
  SELECT firstName FROM employees EXCEPT ALL SELECT contactFirstName FROM customers ORDER BY firstName;
