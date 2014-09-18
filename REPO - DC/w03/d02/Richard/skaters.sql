CREATE TABLE user (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  county varchar(100) NOT NULL,
  total_score integer NOT NULL
  );

CREATE TABLE scores_relationship (
  id serial PRIMARY KEY,
  skaters_id integer REFERENCES skaters (id) NOT NULL,
  judges_id integer REFERENCES judges (id) NOT NULL

CREATE TABLE judges (
  id serial PRIMARY KEY,
  points integer NOT NULL,
  name varchar(100) NOT NULL,
  );

