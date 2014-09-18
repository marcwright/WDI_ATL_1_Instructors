DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;

CREATE TABLE movies (
  id serial primary key,
  title varchar(300) NOT NULL
);

CREATE TABLE actors (
  id serial primary key,
  name varchar(300) NOT NULL
);

CREATE TABLE roles (
  id serial primary key,
  movie_id integer references movies(id),
  actor_id integer references actors(id)
);
