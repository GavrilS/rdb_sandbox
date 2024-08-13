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

- WHERE clause:
  SELECT lastname, firstname, jobtitle FROM employees WHERE jobtitle = 'Sales Rep';
  SELECT lastname, firstname, jobtitle, officeCode FROM employees WHERE jobtitle = 'Sales Rep' AND officeCode = 1;
  SELECT lastName, firstName, jobTitle, officeCode FROM employees WHERE jobtitle = 'Sales Rep' OR officeCode = 1 ORDER BY officeCode, jobTitle;
  SELECT lastName, firstName, officeCode FROM employees WHERE officeCode BETWEEN 1 AND 3 ORDER BY officeCode;
  SELECT lastName, firstName FROM employees WHERE lastName LIKE '%son' ORDER BY lastName;
  SELECT lastName, firstName, officeCode FROM employees WHERE officeCode in (1, 2, 3) ORDER BY officeCode;
  SELECT lastName, firstName, reportsTo FROM employees WHERE reportsTo IS NULL;
  SELECT lastName, firstName, jobTitle FROM employees WHERE jobTitle <> 'Sales Rep';
  SELECT lastName, firstName, officeCode FROM employees WHERE officeCode > 3 ORDER BY officeCode;
  SELECT lastName, firstName, officeCode FROM employees WHERE officeCode <= 4 ORDER BY officeCode;

- DISTINCT clause:
  SELECT lastName FROM employees ORDER BY lastName;
  SELECT DISTINCT lastName FROM employees ORDER BY lastName;
  SELECT state FROM customers ORDER BY state;
  SELECT DISTINCT state FROM customers ORDER BY state;
  SELECT DISTINCT state, city FROM customers WHERE state IS NOT NULL ORDER BY state, city;

- LIKE operator:
  SELECT firstName, lastName, employeeNumber FROM employees WHERE firstName LIKE 'a%';
  SELECT firstName, lastName, employeeNumber FROM employees WHERE lastName LIKE '%son';
  SELECT firstName, lastName, employeeNumber FROM employees WHERE lastName LIKE '%on%';
  SELECT firstName, lastName, employeeNumber FROM employees WHERE firstName LIKE 'T_m';
  SELECT firstName, lastName, employeeNumber FROM employees WHERE lastName NOT LIKE 'B%';
  SELECT productCode, productName FROM products WHERE productCode LIKE '%\_20%';
  SELECT productCode, productName FROM products WHERE productCode LIKE '%$_20%' ESCAPE '$';

- LIMIT clause:
  SELECT customerName, customerNumber, creditLimit FROM customers ORDER BY creditLimit LIMIT 5;
  SELECT customerName, customerNumber, creditLimit FROM customers ORDER BY creditLimit DESC LIMIT 5;
  SELECT customerName, customerNumber, creditLimit FROM customers ORDER BY creditLimit, customerNumber DESC LIMIT 5;
  SELECT COUNT(\*) FROM customers;
  SELECT customerNumber, customerName FROM customers ORDER BY customerName LIMIT 10;
  SELECT customerNumber, customerName FROM customers ORDER BY customerName LIMIT 10,10;
  SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit DESC;
  SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit DESC LIMIT 2;
  SELECT customerNumber, customerName, creditLimit FROM customers ORDER BY creditLimit DESC LIMIT 1, 1;
  SELECT DISTINCT state FROM customers WHERE state IS NOT NULL LIMIT 5;
  SELECT state FROM customers WHERE state IS NOT NULL LIMIT 5;
