DROP TABLE IF EXISTS episodes;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS judges;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS judgments;

CREATE TABLE episodes(
  id serial PRIMARY KEY,
  epi_num integer NOT NULL,
  season integer NOT NULL,
  air_date date
);

CREATE TABLE rounds(
  id serial PRIMARY KEY,
  time_limit integer NOT NULL,
  round_num integer NOT NULL,
  episode_id integer REFERENCES episodes(id)
);

CREATE TABLE chefs(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  age integer NOT NULL,
  gender varchar(1) NOT NULL,
  episode_id integer REFERENCES episodes(id)
);

CREATE TABLE judges(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  age integer NOT NULL,
  gender varchar(1) NOT NULL,
  episode_id integer REFERENCES episodes(id)
);

CREATE TABLE dishes(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  chef_id integer REFERENCES chefs(id),
  round_id integer REFERENCES rounds(id)
);

CREATE TABLE judgments(
  judge_id integer REFERENCES judges(id),
  dish_id integer REFERENCES dishes(id),
  episode_id integer REFERENCES episodes(id)
);

CREATE TABLE scores(
  judge_id integer REFERENCES judges(id),
  dish_id integer REFERENCES dishes(id)
);


