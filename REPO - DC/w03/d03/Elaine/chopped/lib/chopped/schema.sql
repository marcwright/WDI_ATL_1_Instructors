DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS judges;


CREATE TABLE chefs (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  hometown varchar(50) NOT NULL,
  restaurant varchar(50) NOT NULL
);

CREATE TABLE rounds (
  id serial PRIMARY KEY,
  course varchar(10) NOT NULL
);


CREATE TABLE dishes (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  round_id integer REFERENCES rounds (id),
  chef_id integer REFERENCES chefs (id)
);

CREATE TABLE judges (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  restaurant varchar(100) NOT NULL
);

CREATE TABLE scores (
  id serial PRIMARY KEY,
  value integer NOT NULL,
  dish_id integer REFERENCES dishes (id),
  judge_id integer REFERENCES judges (id)
);
