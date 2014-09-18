DROP TABLE IF EXISTS rounds CASCADE;
DROP TABLE IF EXISTS judges CASCADE;
DROP TABLE IF EXISTS chefs CASCADE;
DROP TABLE IF EXISTS dishes CASCADE;
DROP TABLE IF EXISTS scores CASCADE;


CREATE TABLE rounds (
  id serial primary key
);

CREATE TABLE judges (
  id serial primary key,
  name varchar(100) NOT NULL
);

CREATE TABLE chefs (
  id serial primary key,
  name varchar(100) NOT NULL,
  round_id INTEGER REFERENCES rounds(id) NOT NULL
);

CREATE TABLE dishes (
  id serial primary key,
  description TEXT,
  chef_id INTEGER REFERENCES chefs(id) NOT NULL
);

CREATE TABLE scores (
  id serial primary key,
  judge_id INTEGER REFERENCES judges(id) NOT NULL,
  dish_id INTEGER REFERENCES dishes(id) NOT NULL,
  score INTEGER
);
