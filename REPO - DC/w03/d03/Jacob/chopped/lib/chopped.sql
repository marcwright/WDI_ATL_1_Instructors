DROP TABLE IF EXISTS episodes;
DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS judges;

CREATE TABLE episodes (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  season_number integer NOT NULL,
  episode_number integer NOT NULL
);

CREATE TABLE rounds (
  id serial PRIMARY KEY,
  round_number integer NOT NULL,
  theme varchar(50) NOT NULL,
  episode_id integer REFERENCES episodes(id)
);

CREATE TABLE chefs (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  episode_id integer REFERENCES episodes(id)
);

CREATE TABLE dishes (
  id serial PRIMARY KEY,
  title varchar(50) NOT NULL,
  chef_id integer REFERENCES chefs(id),
  round_id integer REFERENCES rounds(id)
);

CREATE TABLE judges (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE scores (
  id serial PRIMARY KEY,
  numerical_score integer NOT NULL,
  dish_id integer REFERENCES dishes(id),
  judge_id integer REFERENCES judges(id)
);


