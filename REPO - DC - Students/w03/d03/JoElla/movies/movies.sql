
drop table if exists actors;
drop table if exists movies;
drop table if exists roles;

create table actors (
  id serial primary key,
  name varchar(40) not null
);

create table movies (
  id serial primary key,
  title varchar(100) not null,
  year integer not null
);

create table roles (
  id serial primary key,
  actor_id integer references actors(id),
  movie_id integer references movies(id)

);


