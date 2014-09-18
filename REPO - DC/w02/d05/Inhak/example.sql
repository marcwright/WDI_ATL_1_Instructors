CREATE TABLE animals (
  id serial PRIMARY KEY,
  species varchar(25) NOT NULL,
  sex varchar(1) NOT NULL,
  top_land_speed integer NOT NULL
);

CREATE TABLE employees (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  age integer NOT NULL,
  title varchar(25) NOT NULL,
  badge_number integer UNIQUE NOT NULL
);
