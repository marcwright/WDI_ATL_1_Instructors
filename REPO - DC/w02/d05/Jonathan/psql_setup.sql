CREATE TABLE employees (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  age INTEGER NOT NULL,
  title VARCHAR(60) NOT NULL,
  badge_number INTEGER UNIQUE NOT NULL,
);
