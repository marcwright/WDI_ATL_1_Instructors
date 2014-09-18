DROP TABLE IF EXISTS rounds CASCADE; 
DROP TABLE IF EXISTS ingredients CASCADE;
DROP TABLE IF EXISTS contestants CASCADE;
DROP TABLE IF EXISTS dishes CASCADE;

CREATE TABLE contestants (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE rounds (
  id serial PRIMARY KEY,
  title VARCHAR(50) NOT NULL
);

CREATE TABLE dishes (
  id serial PRIMARY KEY,
  contestant_id integer REFERENCES contestants(id),
  round_id integer REFERENCES rounds(id),
  dish_name VARCHAR(50) NOT NULL,
  chopped boolean DEFAULT 'false'
);

CREATE TABLE ingredients (
  id serial PRIMARY KEY,
  description text NOT NULL,
  round_id integer REFERENCES rounds(id)
);
