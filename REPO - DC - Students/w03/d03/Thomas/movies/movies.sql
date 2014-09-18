DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE actors (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE roles (
  id serial PRIMARY KEY,
  movie_id integer REFERENCES movies(id),
  actor_id integer REFERENCES actors(id)
);
