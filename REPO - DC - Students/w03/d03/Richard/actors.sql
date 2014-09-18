DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS roles;

CREATE TABLE movies (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  director varchar(100) NOT NULL
);

CREATE TABLE actors (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);
-- movies & actor relation
CREATE TABLE roles (
  id serial PRIMARY KEY,
  movie_id integer REFERENCES movies (id) NOT NULL,
  actor_id integer REFERENCES actors (id) NOT NULL
);
