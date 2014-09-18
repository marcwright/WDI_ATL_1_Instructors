DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS movies;

CREATE TABLE actors(
  id serial PRIMARY KEY,
  name varchar NOT NULL
);

CREATE TABLE movies(
  id serial PRIMARY KEY,
  title varchar NOT NULL
);

CREATE TABLE roles(
  id serial PRIMARY KEY,
  actor_id integer REFERENCES actors(id),
  movie_id integer REFERENCES movies(id)
);
