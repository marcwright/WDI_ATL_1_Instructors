create table actors (
  id        serial primary key,
  name      varchar(127) not null,
  birthday  date
);

create table movies (
  id      serial primary key,
  title   varchar(127) not null,
  year    integer not null
);

create table roles (
  actor_id    integer references actors,
  movie_id    integer references movies,
  character   varchar(127) not null
);
