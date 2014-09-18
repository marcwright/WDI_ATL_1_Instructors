CREATE TABLE series (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  creator VARCHAR(50) NOT NULL,
  exec_prod VARCHAR(50) NOT NULL
);

CREATE TABLE seasons (
  id serial PRIMARY KEY,
  season_num integer UNIQUE
);

CREATE TABLE episodes (
  id serial PRIMARY KEY,
  season_id REFERENCES seasons (id) NOT NULL,
  exec_prod REFERENCES series (id) NOT NULL,
  creator_id REFERENCES series (id) NOT NULL,
  episode_num integer,
  air_date date UNIQUE,
  episodes integer NOT NULL
);

CREATE TABLE contestants (
  id serial PRIMARY KEY,
  episode_id REFERENCES episodes (id) NOT NULL,
  name VARCHAR(50) UNIQUE,
  gender VARCHAR(6) NOT NULL
);

CREATE TABLE marriages (
  is serial PRIMARY KEY,
  episode_id REFERENCES episodes (id) NOT NULL,
  bachelor_id REFERENCES contestants (id) UNIQUE,
  contestant_id REFERENCES contestants (id) UNIQUE
);
