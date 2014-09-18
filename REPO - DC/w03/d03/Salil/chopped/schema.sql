

CREATE TABLE rounds (
  id serial primary key,
  name varchar(100) NOT NULL
);

CREATE TABLE dishes (
  id serial primary key,
  name varchar(100) NOT NULL,
  round_id integer references rounds(id)
);

CREATE TABLE judges (
  id serial primary key,
  name varchar(100) NOT NULL
);

CREATE TABLE scores (
  id serial primary key,
  value integer NOT NULL,
  dish_id integer references dishes(id),
  judge_id integer references judges(id)
);
