
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS actors;
DROP TABLE IF EXISTS roles;

CREATE TABLE movies (
id serial primary key,
title varchar(100) NOT NULL,
director varchar(100) NOT NULL
);

CREATE TABLE actors (
id serial primary key,
name varchar(100) NOT NULL
);

CREATE TABLE roles  (
id serial primary key,
movie_id integer references movies(id) NOT NULL,
actor_id integer references actors(id) NOT NULL
);
