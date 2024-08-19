- Column Aliases
  SELECT CONCAT_WS(', ', lastName, firstName) FROM employees;
  SELECT CONCAT_WS(', ', lastName, firstName) AS 'Full name' FROM employees;
  SELECT CONCAT_WS(', ', lastName, firstName) AS 'Full name' FROM employees ORDER BY 'Full name';
  SELECT orderNumber 'Order no.', SUM(priceEach \* quantityOrdered) Total FROM orderdetails GROUP BY 'Order no.' HAVING total > 60000;

- Table Aliases
  SELECT \* FROM employees e;
  SELECT e.firstName, e.lastName FROM employees e ORDER BY e.firstName;
  SELECT customerName, COUNT(o.orderNumber) total FROM customers c INNER JOIN orders o ON c.customerNumber = o.customerNumber GROUP BY customerName ORDER BY total DESC;

- Join tables
  CREATE TABLE members (
  member*id INT AUTO_INCREMENT,
  name VARCHAR(100),
  PRIMARY KEY (member_id)
  );
  CREATE TABLE committees (
  committee_id INT AUTO_INCREMENT,
  name VARCHAR(100),
  PRIMARY KEY (committee_id)
  );
  INSERT INTO members(name)
  VALUES ('John'), ('Jane'), ('Mary'), ('David'), ('Amelia');
  INSERT INTO committees(name)
  VALUES ('John'), ('Mary'), ('Amelia'), ('Joe');
  SELECT * FROM members;
  SELECT \_ FROM committees;

- Inner Join
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m INNER JOIN committees c ON c.name = m.name;
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m INNER JOIN committees c USING(name);

- Left Join
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m LEFT JOIN committees c ON c.name = m.name;
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m LEFT JOIN committees c USING(name);
  SELECT m.member_id, m.name AS member, c.committee_id, c.name as committee
  FROM members m LEFT JOIN committees c USING(name) WHERE c.committee_id IS NULL;

- Right Join
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m RIGHT JOIN committees c ON c.name = m.name;
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m RIGHT JOIN committees c USING(name);
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m RIGHT JOIN committees c USING(name) WHERE m.member_id IS NULL;

- Cross Join
  SELECT m.member_id, m.name AS member, c.committee_id, c.name AS committee
  FROM members m CROSS JOIN committees c;

- Self Join
  SELECT CONCAT(m.lastName, ', ', m.firstName) AS Manager,
  CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
  FROM employees e INNER JOIN employees m ON m.employeeNumber = e.reportsTo
  ORDER BY Manager;

- Group By
  SELECT status FROM orders GROUP BY status;
  SELECT DISTINCT status FROM orders;
  SELECT status, COUNT(\*) FROM orders GROUP BY status;
  SELECT status, SUM(quantityOrdered \* priceEach) AS amount FROM orders
  INNER JOIN orderdetails USING (orderNumber) GROUP BY status;
  SELECT orderNumber, SUM(quantityOrdered \* priceEach) AS total FROM orderdetails
  GROUP BY orderNumber;
  SELECT YEAR(orderDate) AS year, SUM(quantityOrdered \* priceEach) AS total
  FROM orders INNER JOIN orderdetails USING (orderNumber) WHERE status = 'Shipped'
  GROUP BY YEAR(orderDate);
  SELECT YEAR(orderDate) as year, SUM(quantityOrdered \* priceEach) as total
  FROM orders INNER JOIN orderdetails USING (orderNumber) WHERE status = 'Shipped'
  GROUP BY year HAVING year > 2003;
  SELECT YEAR(orderDate) AS year, status, SUM(quantityOrdered \* priceEach) as total
  FROM orders INNER JOIN orderdetails USING (orderNumber) GROUP BY year, status
  ORDER BY year;

- Having
  SELECT orderNumber, SUM(quantityOrdered) AS itemCount, SUM(priceEach \* quantityOrdered) AS total
  FROM orderdetails GROUP BY orderNumber;
  SELECT orderNumber, SUM(quantityOrdered) AS itemCount, SUM(priceEach \* quantityOrdered) AS total
  FROM orderdetails GROUP BY orderNumber HAVING total > 1000;
  SELECT orderNumber, SUM(quantityOrdered) AS itemCount, SUM(priceEach \* quantityOrdered) AS total
  FROM orderdetails GROUP BY orderNumber HAVING total > 1000 AND itemCount > 600;

- Having Count
  SELECT customerName, COUNT(_) order_count FROM orders INNER JOIN customers USING (customerNumber) GROUP BY customerName HAVING COUNT(_) > 4 ORDER BY order_count;

- ROLLUP clause - to generate subtotals and grand totals
  CREATE TABLE sales
  SELECT productLine, YEAR(orderDate) orderYear, SUM(quantityOrdered \* priceEach) orderValue
  FROM orderdetails INNER JOIN orders USING (orderNumber) INNER JOIN products USING (productCode)
  GROUP BY productLine, YEAR(orderDate);
  SELECT \* FROM sales;
  SELECT productline, SUM(orderValue) totalOrderValue
  FROM sales GROUP BY productline;
  SELECT productline, SUM(orderValue) totalOrderValue
  FROM sales GROUP BY productline;
  SELECT SUM(orderValue) totalOrderValue FROM sales;
  SELECT productline, SUM(orderValue) totalOrderValue
  FROM sales GROUP BY productline
  UNION ALL SELECT NULL, SUM(orderValue) totalOrderValue FROM sales;
