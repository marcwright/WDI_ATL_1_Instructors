CREATE TABLE clients (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  contact_info varchar(100) NOT NULL,
  event_id integer REFERENCES events (id)

);

CREATE TABLE events (
  id serial PRIMARY KEY,
  event_name varchar(100) NOT NULL,
  date_time varchar(10) NOT NULL,
  photo_id integer REFERENCES photos (id)
);

CREATE TABLE photos (
  id serial PRIMARY KEY,
  time timestamp
);
