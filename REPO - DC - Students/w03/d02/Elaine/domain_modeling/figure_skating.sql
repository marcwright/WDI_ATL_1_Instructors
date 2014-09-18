CREATE TABLE skaters (
  id serial PRIMARY KEY,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  country varchar(50) NOT NULL,
  age integer NOT NULL,
  score_id integer REFERENCES scores (id) NOT NULL
);

CREATE TABLE scores (
  id serial PRIMARY KEY,
  judge_id integer REFERENCES judges (id) NOT NULL,
  score integer NOT NULL
);

CREATE TABLE judges (
  id serial PRIMARY KEY,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  country varchar(50) NOT NULL
);
