DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS houses;

CREATE TABLE students (
  id serial4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  house VARCHAR(255),
  age INT4
);
