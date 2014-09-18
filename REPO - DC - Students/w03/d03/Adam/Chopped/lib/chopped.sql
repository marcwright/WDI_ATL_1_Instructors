DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS judges;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS chefs;

CREATE TABLE chefs (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE rounds (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE dishes (
  id serial PRIMARY KEY,
  chef_id integer REFERENCES chefs(id),
  round_id integer REFERENCES rounds(id)
);

CREATE TABLE judges (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE scores (
  id serial PRIMARY KEY,
  dish_id integer REFERENCES dishes(id),
  judge_id integer REFERENCES judges(id)
);







