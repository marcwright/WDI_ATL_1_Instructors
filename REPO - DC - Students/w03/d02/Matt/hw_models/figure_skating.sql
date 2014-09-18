CREATE TABLE judges (
  id serial PRIMARY KEY,
  name varchar(300) NOT NULL,
  country varchar(300) NOT NULL,
);

CREATE TABLE skaters (
  id serial PRIMARY KEY,
  name varchar(300) NOT NULL,
  country varchar(300) NOT NULL,
  score INTEGER NOT NULL,
  REFERENCES judges(id)
);
