DROP TABLE IF EXISTS rounds;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS roles;


CREATE TABLE actors (
  id serial primary key,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL
);

CREATE TABLE movies (
  id serial primary key,
  title varchar(100) NOT NULL
);


CREATE TABLE roles (
  id serial primary key,
  actor_id INTEGER REFERENCES actors (id) NOT NULL,
  movie_id INTEGER REFERENCES movies (id) NOT NULL
);
