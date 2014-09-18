CREATE TABLE skaters (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
);

CREATE TABLE judges (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  scores integer(3) NOT NULL,
);

CREATE TABLE scores (
  id serial PRIMARY KEY,
  score integer(3) NOT NULL,
);
