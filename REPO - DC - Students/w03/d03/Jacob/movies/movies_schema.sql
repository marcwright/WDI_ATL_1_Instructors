DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS roles;

CREATE TABLE actors (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE movies (
  id serial PRIMARY KEY,
  title varchar(50) NOT NULL,
  year integer NOT NULL
);

CREATE TABLE roles (
  id serial PRIMARY KEY,
  actor_id integer REFERENCES actors (id),
  movie_id integer REFERENCES movies (id)
);
