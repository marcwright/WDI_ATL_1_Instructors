DROP TABLE IF EXISTS scores;
DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS judges;
DROP TABLE IF EXISTS episodes;


CREATE TABLE episodes(
  id serial PRIMARY KEY,
  episode_name varchar NOT NULL UNIQUE
  season_number integer,
  episode_number integer
);
CREATE TABLE rounds(
  id serial PRIMARY KEY,
  round_number integer,
  theme varchar,
  episode_id integer REFERENCES episodes(id)
);
CREATE TABLE chefs(
  id serial PRIMARY KEY,
  name varchar NOT NULL,
  episode_id integer REFERENCES episodes(id)
);
CREATE TABLE dishes(
  id serial PRIMARY KEY,
  title varchar NOT NULL,
  round_id integer REFERENCES rounds(id),
  chef_id integer REFERENCES chefs(id)
);
CREATE TABLE scores(
  id serial PRIMARY KEY,
  score integer NOT NULL,
  dish_id integer REFERENCES dishes(id),
  judge_id integer REFERENCES judges(id)
);
CREATE TABLE judges(
  id serial PRIMARY KEY,
  name varchar NOT NULL
)
