DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;

CREATE TABLE actors (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL
);

CREATE TABLE movies (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  year integer NOT NULL
);

CREATE TABLE roles (
  id serial PRIMARY KEY,
  movie_id integer REFERENCES movies (id),
  actor_id integer REFERENCES actors (id)
  );
