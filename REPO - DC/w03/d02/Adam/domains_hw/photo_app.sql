CREATE TABLE photographer (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
);

CREATE TABLE client (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  event_id
);


CREATE TABLE events (
  id serial PRIMARY KEY,
  picture varchar(100) NOT NULL,
  parent_id integer REFERENCES client (id) NOT NULL,
);

CREATE TABLE album (
  id serial PRIMARY KEY,
  pictures varchar(100) NOT NULL,
);
