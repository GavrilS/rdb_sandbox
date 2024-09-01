# Storage Engines:

- a software component responsible for managing how data is stored, retrieved and manipulated within tables; also determines the underlying structure and features of the table
- MySQL supports multiple storage engines
- find the available storage engine:
  SELECT engine, support FROM information_schema.engines ORDER BY engine;
  SHOW ENGINES;
- specify engine when creating a table(if not specified, default is used):
  CREATE TABLE (column_list) ENGINE = engine_name;

# Creating tables:

- create a table with a foreign key:
  CREATE TABLE tasks (
  id INT PRIMARY KEY,
  title VARCHAR(55) NOT NULL,
  start_date DATE,
  end_date DATE
  );
  CREATE TABLE checklists (
  id INT,
  task_id INT,
  title VARCHAR(55) NOT NULL,
  is_completed BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (id, task_id),
  FOREIGN KEY (task_id)
  REFERENCES tasks (id)
  ON UPDATE RESTRICT
  ON DELETE CASCADE
  );

# Auto-increment - automatically generate unique integer values for a column when inserting a new row

- create a table with auto-increment:
  CREATE TABLE contacts (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(60) NOT NULL
  );
  INSERT INTO contacts (name, email) VALUES ('Steve Carrel', 'sc@test.com');

- retrieve the last auto-increment value:
  SELECT LAST_INSERT_ID();

- reset the auto increment value - needs to be more or equal to the current auto-increment value:
  ALTER TABLE contacts AUTO_INCREMENT = 0;
  ALTER TABLE contacts AUTO_INCREMENT = 1;

- add an auto-increment column to an existing table:
  CREATE TABLE subscribers (
  email VARCHAR(100) NOT NULL UNIQUE
  );
  ALTER TABLE subscribers ADD id INT AUTO_INCREMENT PRIMARY KEY;
