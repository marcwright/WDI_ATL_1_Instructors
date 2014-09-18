-- Stephen Stanwood (stephen@stanwoodsolutions.com) --

DROP TABLE IF EXISTS movies;
CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  year INTEGER NOT NULL
);

DROP TABLE IF EXISTS actors;
CREATE TABLE actors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  movie_id INTEGER REFERENCES movies(id),
  actor_id INTEGER REFERENCES actors(id)
);
