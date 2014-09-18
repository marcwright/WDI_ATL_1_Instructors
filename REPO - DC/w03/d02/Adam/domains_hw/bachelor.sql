CREATE TABLE bachelor (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
);

CREATE TABLE women (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
);

CREATE TABLE episodes (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  rose_ceremoney varchar(50) NOT NULL,
);

CREATE TABLE elimination (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  parent_id integer REFERENCES episodes (id) NOT NULL,
);

CREATE TABLE marriage (
  id serial PRIMARY KEY,
  yes_or_no boolean(1) NOT NULL,
);
