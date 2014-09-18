
create table episodes (
  id serial primary key,
  title varchar(50) not null
);


create table rounds (
  id serial primary key,
  theme varchar(100) not null,
  episode_id integer references episodes(id)
);

create table chefs (
  id serial primary key,
  name varchar(50) not null,
  episode_id integer references episodes(id)

);

create table dishes (
  id serial primary key,
  round_id integer references rounds(id),
  chef_id integer references chefs(id)
);

create table judges (
  id serial primary key,
  name varchar(50) not null
);

create table scores (
  id serial primary key,
  score_value integer not null,
  judge_id integer references judges(id),
  dish_id integer references dishes(id)
);

