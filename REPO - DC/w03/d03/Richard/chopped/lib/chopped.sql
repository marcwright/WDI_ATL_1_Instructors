DROP TABLE IF EXISTS episodes;
DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS judgments;
DROP TABLE IF EXISTS judges;
DROP TABLE IF EXISTS chefs;


CREATE TABLE episodes (
  id serial PRIMARY KEY,
  episode_no varchar(15) NOT NULL,
  season_no varchar(100) NOT NULL,
  air_date date NOT NULL
  );

CREATE TABLE rounds (
  id serial PRIMARY KEY,
  round_no integer NOT NULL,
  time_limit integer NOT NULL,
  episode_id integer REFERENCES episodes (id) NOT NULL
);

CREATE TABLE chefs (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  age integer NOT NULL,
  gender varchar(1) NOT NULL,
  home_town varchar(50) NOT NULL,
  episode_id integer REFERENCES episodes (id) NOT NULL,
  --chopped BOOLEAN DEFAULT 'false'
  );

  CREATE TABLE dishes (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  chef_id integer REFERENCES chefs (id) NOT NULL
  round_id integer REFERENCES rounds (id) NOT NULL
  );

  CREATE TABLE scores (
  id serial PRIMARY KEY,
  score integer NOT NULL,
  judge_id integer REFERENCES judges (id) NOT NULL,
  dish_id integer REFERENCES dishes (id) NOT NULL
  );

  CREATE TABLE judges (
  id serial PRIMARY KEY,
  age integer NOT NULL,
  profession varchar NOT NULL,
  name varchar(100) NOT NULL,
  nationality varchar(100) NOT NULL
  );

  CREATE TABLE judgments (
  id serial PRIMARY KEY,
  episode_id integer REFERENCES episodes (id) NOT NULL,
  judge_id integer REFERENCES judges (id) NOT NULL
  );
