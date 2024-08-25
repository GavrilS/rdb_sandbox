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
