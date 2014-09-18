DROP TABLE IF EXISTS contestants CASCADE;
DROP TABLE IF EXISTS dishes CASCADE;
DROP TABLE IF EXISTS ingredients CASCADE;
DROP TABLE IF EXISTS rounds CASCADE;

CREATE TABLE rounds (
  id serial PRIMARY KEY,
  level varchar(100) NOT NULL
);

CREATE TABLE contestants (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE dishes (
  id serial PRIMARY KEY,
  contestant_id integer REFERENCES contestants(id),
  round_id integer REFERENCES rounds(id),
  chopped BOOLEAN
);

CREATE TABLE ingredients (
  id serial PRIMARY KEY,
  round_id integer REFERENCES rounds(id),
  description text
);
