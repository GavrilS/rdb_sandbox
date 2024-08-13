- Column Aliases
  SELECT CONCAT_WS(', ', lastName, firstName) FROM employees;
  SELECT CONCAT_WS(', ', lastName, firstName) AS 'Full name' FROM employees;
  SELECT CONCAT_WS(', ', lastName, firstName) AS 'Full name' FROM employees ORDER BY 'Full name';
  SELECT orderNumber 'Order no.', SUM(priceEach \* quantityOrdered) Total FROM orderdetails GROUP BY 'Order no.' HAVING total > 60000;

- Table Aliases
  SELECT \* FROM employees e;
  SELECT e.firstName, e.lastName FROM employees e ORDER BY e.firstName;
  SELECT customerName, COUNT(o.orderNumber) total FROM customers c INNER JOIN orders o ON c.customerNumber = o.customerNumber GROUP BY customerName ORDER BY total DESC;
