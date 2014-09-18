create table rounds (
  id          serial unique not null,
  episode_no  integer not null,
  round       varchar(127) not null,
  primary key(episode_no, round)
);

create table ingredients (
  id          serial primary key,
  name        varchar(127) unique not null
);

create table ingredients_rounds (
  id              serial unique not null,
  round_id        integer references rounds(id) not null,
  ingredient_id   integer references ingredients(id) not null,
  primary key(round_id, ingredient_id)
);

create table chefs (
  id          serial primary key,
  name        varchar(127) not null,
  job_title   varchar(127) not null,
  employer    varchar(127) default '',
  city        varchar(127) not null,
  state       char(2) not null
);

create table dishes (
  id        serial unique not null,
  chef_id   integer references chefs(id) not null,
  round_id  integer references rounds(id) not null,
  name      varchar(127) not null,
  chopped   boolean not null,
  primary key(chef_id, round_id)
);

