CREATE TABLE rounds(
  id serial PRIMARY KEY,
  title varchar(50) NOT NULL
);

CREATE TABLE dishes(
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  chopped boolean NOT NULL,
  contestant_id integer REFERENCES contestants(id),
  round_id integer REFERENCES rounds(id)
);

CREATE TABLE contestants(
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL
);
