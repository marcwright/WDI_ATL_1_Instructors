DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;

CREATE TABLE movies (
  id serial primary key,
  title varchar(100) NOT NULL,
  year integer NOT NULL,
);

CREATE TABLE actors (
  id serial primary key,
  name varchar(100) NOT NULL,
);


CREATE TABLE roles (
  id serial primary key,
  movie_id integer references movies(id)
  actor_id integer references actors(id)
);

