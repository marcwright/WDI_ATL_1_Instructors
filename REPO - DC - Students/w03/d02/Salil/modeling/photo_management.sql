

CREATE TABLE photographer (
  id serial primary key,
  name varchar(100) NOT NULL,
);

CREATE TABLE clients (
  id serial primary key,
  name varchar(100) NOT NULL,
  login varchar(100) NOT NULL
);


CREATE TABLE events (
  id serial primary key,
  event VARCHAR(100) NOT NULL,
  date integer NOT NULL
);

CREATE TABLE photo (
  id serial primary key,
  time timestamp
);
