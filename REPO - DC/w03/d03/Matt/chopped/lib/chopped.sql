DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS judges;

CREATE TABLE judges (
  id serial primary key,
  name varchar(300) NOT NULL
);

CREATE TABLE chefs (
  id serial primary key,
  name varchar(300) NOT NULL,
  eliminated boolean default false,
  bank money default(0)
);

CREATE TABLE dishes (
  id serial primary key,
  item varchar(300) NOT NULL,
  chef_id integer references chefs(id)
);

CREATE TABLE scores (
  id serial primary key,
  score integer,
  round integer,
  judge_id integer references judges(id),
  dish_id integer references dishes(id)
);
