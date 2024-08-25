- Subqueries
  SELECT lastName, firstName FROM employees WHERE officeCode IN (
  SELECT officeCode FROM offices WHERE country = 'USA'
  );
  SELECT customerNumber, checkNumber, amount FROM payments
  WHERE amount = (SELECT MAX(amount) from payments);
  SELECT customerNumber, checkNumber, amount FROM payments
  WHERE amount > (SELECT AVG(amount) from payments);
  SELECT customerName FROM customers WHERE customerNumber NOT IN (SELECT DISTINCT
  customerNumber FROM orders);
  SELECT MAX(items), MIN(items), FLOOR(AVG(items)) FROM (SELECT
  orderNumber, COUNT(orderNumber) as items FROM orderdetails GROUP BY orderNumber) AS lineitems;

- Correlated Subqueries
  SELECT productname, buyprice FROM products p1 WHERE buyprice > (
  SELECT AVG(buyprice) FROM products WHERE productline = p1.productline
  );

- Exists/Not Exists
  SELECT orderNumber, SUM(priceEach _ quantityOrdered) total FROM orderdetails INNER JOIN
  orders USING (orderNumber) GROUP BY orderNumber HAVING SUM(priceEach _ quantityOrdered) > 60000;
  SELECT customerNumber, customerName FROM customers WHERE EXISTS (
  SELECT orderNumber, SUM(priceEach _ quantityOrdered) FROM orderdetails INNER JOIN
  orders USING (orderNumber) WHERE customerNumber = customers.customerNumber
  GROUP BY orderNumber HAVING SUM(priceEach _ quantityOrdered) > 60000
  );

- Derived tables - when a stand-alone subquery is used in the FROM clause of a SELECT statement, it is called a derived table
  Exmpl: SELECT select*list FROM (SELECT select_list FROM table_1) derived_table_name
  WHERE derived_table_name.c1 > 0;
  SELECT productCode, ROUND(SUM(priceEach \* quantityOrdered)) sales FROM orderdetails
  INNER JOIN orders USING (orderNumber) WHERE YEAR(shippedDate) = 2003
  GROUP BY productCode ORDER BY sales DESC LIMIT 5;
  SELECT productName, sales FROM (
  SELECT productCode, ROUND(SUM(quantityOrdered \* priceEach)) sales FROM orderdetails
  INNER JOIN orders USING (orderNumber) WHERE YEAR(shippedDate) = 2003
  GROUP BY productCode ORDER BY sales DESC LIMIT 5
  ) top5products2003 INNER JOIN products USING (productCode);
  SELECT customerNumber, ROUND(SUM(quantityOrdered * priceEach)) sales, (
  CASE WHEN SUM(quantityOrdered _ priceEach) < 10000 THEN 'Silver'
  WHEN SUM(quantityOrdered _ priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
  WHEN SUM(quantityOrdered \_ priceEach) > 100000 THEN 'Platinum' END
  ) customerGroup FROM orderdetails INNER JOIN orders USING (orderNumber)
  WHERE YEAR(shippedDate) = 2003 GROUP BY customerNumber;

- Exists operator - often used to test for the existence of rows returned by the subquery
  SELECT select_list FROM a_table WHERE [NOT] EXISTS (subquery);
  SELECT customerNumber, customerName FROM customers WHERE EXISTS(
  SELECT 1 FROM orders WHERE orders.customernumber = customers.customernumber
  );
  SELECT customerNumber, customerName FROM customers WHERE NOT EXISTS(
  SELECT 1 FROM orders WHERE orders.customerNumber = customers.customerNumber
  );
  SELECT employeenumber, firstname, lastname, extension FROM employees WHERE EXISTS(
  SELECT 1 FROM offices WHERE city = 'San Francisco' AND
  offices.officeCode = employees.officeCode
  );
