employee.sql

CREATE TABLE employees (
  id serial PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  age INTEGER NOT NULL,
  title VARCHAR(15) NOT NULL,
  badge_number INTEGER UNIQUE NOT NULL
);
