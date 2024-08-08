- Change to the database we want to use:
  use classicmodels;

- Retrieve data from a table:
  SELECT lastName FROM employees;

  SELECT \* FROM employees;

  SELECT
  lastName,
  firstName,
  jobTitle
  FROM employees;

- SELECT without FROM:
  SELECT 1 + 1;

  SELECT NOW();
  SELECT CONCAT('John', ' ', 'Doe');
  \*\* Column alias example:
  SELECT CONCAT('John', ' ', 'Doe') AS name;
  SELECT CONCAT('Jane',' ','Doe') AS 'Full name';

- Sorting data:
  \*\* Command form: SELECT select*list FROM table_name ORDER BY column1 [ASC|DESC], column2 [ASC|DESC], ...;
  SELECT contactLastname, contactFirstname FROM customers ORDER BY contactLastname;
  SELECT contactLastname, contactFirstname FROM customers ORDER BY contactLastname DESC;
  SELECT contactLastname, contactFirstname FROM customers ORDER BY contactLastname DESC, contactFirstname ASC;
  SELECT orderNumber, orderlinenumber, quantityOrdered * priceEach FROM orderdetails ORDER BY quantityOrdered \* priceEach DESC;
  SELECT orderNumber, orderlinenumber, quantityOrdered \* priceEach AS subtotal FROM orderdetails ORDER BY quantityOrdered \* priceEach DESC;

* - The FIELD() function returns the index (position) of a value within a list of values; FIELD(value, value1, value2, value3, ...); Ex:
    SELECT FIELD('A', 'A', 'B', 'C');
    SELECT FIELD('B', 'A', 'B', 'C');
    SELECT orderNumber, status FROM orders ORDER BY FIELD(status, 'In Process', 'On Hold', 'Cancelled', 'Resolved', 'Disputed', 'Shipped');

* - ORDER BY and NULL:
    SELECT firstName, lastName, reportsTo FROM employees ORDER BY reportsTo;
    SELECT firstName, lastName, reportsTo FROM employees ORDER BY reportsTo DESC;
