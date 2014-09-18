CREATE TABLE actors (
id serial PRIMARY KEY,
name VARCHAR(42) NOT NULL
);


CREATE TABLE movies(
id serial PRIMARY KEY,
title VARCHAR(42) NOT NULL
);

CREATE TABLE roles(
id serial PRIMARY KEY,
movie_id integer references movies(id),
actor_id integer references actors(id)
);
