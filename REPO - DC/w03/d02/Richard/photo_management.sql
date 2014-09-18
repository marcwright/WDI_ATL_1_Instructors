CREATE TABLE photos (
  id serial PRIMARY KEY,
  captured timestamp NOT NULL
  );

CREATE TABLE events (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  photos_id integer REFERENCES photos (id) NOT NULL,
  location varchar(100) DEFAULT = ''
  );

CREATE TABLE clients (
  id serial PRIMARY KEY,
  name varchar(50) NOT NULL,
  email varchar(100) NOT NULL,
  username varchar(50) NOT NULL UNIQUE,
  password varchar(50) NOT NULL,
  description varchar(250) NOT NULL,
  events_id integer REFERENCES events (id) NOT NULL,
);

