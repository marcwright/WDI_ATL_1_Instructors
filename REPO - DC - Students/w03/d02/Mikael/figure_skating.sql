CREATE TABLE skaters (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  score_id integer REFERENCES scores (id)

);

CREATE TABLE judges (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE scores (
  id serial PRIMARY KEY,
  value integer NOT NULL,
  skater_id integer REFERENCES skaters (id),
  judge_id integer REFERENCES judges (id)
);
