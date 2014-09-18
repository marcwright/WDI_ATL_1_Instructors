DROP TABLE IF EXISTS judges;
DROP TABLE IF EXISTS ratings;
DROP TABLE IF EXISTS chefs;
DROP TABLE IF EXISTS dishes;
DROP TABLE IF EXISTS rounds;

CREATE TABLE judges (
id serial primary key,
name varchar(100) NOT NULL,
age integer NOT NULL
);

CREATE TABLE ratings (
id serial primary key,
score integer
judges_id integer references judges(id) NOT NULL,
dishes_id integer references dishes(id) NOT NULL
);

CREATE TABLE chefs (
id serial primary key,
name varchar(100) NOT NULL
);

CREATE TABLE dishes (
id serial primary key,
rounds_id integer references rounds(id) NOT NULL,
chefs_id integer references chefs(id) NOT NULL
);

CREATE TABLE rounds (
id serial primary key,
course varchar(100) NOT NULL
);