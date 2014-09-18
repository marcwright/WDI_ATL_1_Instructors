CREATE TABLE seasons (
  id serial PRIMARY KEY,
  season_num integer UNIQUE,
);

CREATE TABLE contestants (
  id serial PRIMARY KEY,
  episodes REFERENCES episodes (id) NOT NULL,

);

CREATE TABLE episodes (
  id serial PRIMARY KEY,
  season_id REFERENCES season (id) NOT NULL,
  episode_number integer,
  air_date date UNIQUE,

);

CREATE TABLE
