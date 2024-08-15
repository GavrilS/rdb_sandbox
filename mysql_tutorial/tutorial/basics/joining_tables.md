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
