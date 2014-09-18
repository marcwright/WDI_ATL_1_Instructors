CREATE TABLE employees (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  age integer NOT NULL,
  title varchar(20) NOT NULL,
  badge integer UNIQUE NOT NULL
);
