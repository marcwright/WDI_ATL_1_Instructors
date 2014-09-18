CREATE TABLE actors(
  id serial PRIMARY KEY,
  name varchar(100)
);

CREATE TABLE movies (
  id serial PRIMARY KEY,
  title varchar(250),
  year integer,
  director varchar(100)
);

CREATE TABLE roles (
  actor_id integer REFERENCES actors(id),
  movie_id integer REFERENCES movies(id)
);
