CREATE TABLE show (
  id serial PRIMARY KEY,
  season integer NOT NULL UNIQUE,
  episode integer NOT NULL UNIQUE,
);

CREATE TABLE bachelors (
  id serial PRIMARY KEY,
  name varchar(300) NOT NULL,
  country varchar(300) NOT NULL,
  REFERENCES show(season)
);

CREATE TABLE contestants (
  id serial PRIMARY KEY,
  name varchar(300) NOT NULL,
  elimated boolean default 0,
  REFERENCES show(episode)
);
