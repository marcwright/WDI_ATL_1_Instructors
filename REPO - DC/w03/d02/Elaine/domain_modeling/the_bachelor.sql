CREATE TABLE seasons (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  year integer NOT NULL,
  bachelor varchar(100) NOT NULL,
  women text[]
);

CREATE TABLE episodes (
  id serial PRIMARY KEY,
  season_id integer REFERENCES seasons (id) NOT NULL,
  episode_number integer NOT NULL,
);

CREATE TABLE women (
  id serial PRIMARY KEY,
  season_id integer REFERENCES seasons (id) NOT NULL,
  name varchar(100) NOT NULL,
  hometown varchar(100) NOT NULL,
  age integer NOT NULL,
  occupation varchar(50) NOT NULL,
  active? boolean NOT NULL
);

CREATE TABLE bachelor (
  id serial PRIMARY KEY,
  season_id integer REFERENCES seasons (id) NOT NULL,
  name varchar(100) NOT NULL,
  hometown varchar(100) NOT NULL,
  age integer NOT NULL,
  occupation varchar(50) NOT NULL
);
