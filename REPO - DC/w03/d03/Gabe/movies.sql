DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS roles;

CREATE TABLE actors (
  id serial primary key,
  name varchar(100) NOT NULL
);

CREATE TABLE movies (
  id serial primary key,
  title varchar(100) NOT NULL
);

CREATE TABLE roles (
  id serial primary key,
  actor_id integer REFERENCES actors(id),
  movie_id integer REFERENCES movies(id)
);
