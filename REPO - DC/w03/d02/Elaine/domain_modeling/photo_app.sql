CREATE TABLE client (
  id serial PRIMARY KEY,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  email varchar(50) NOT NULL,
  login varchar(50) UNIQUE,
  password varchar(50) NOT NULL
);

CREATE TABLE events (
  id serial PRIMARY KEY,
  client_id integer REFERENCES clients (id) NOT NULL
  event_date date NOT NULL,
  location varchar(100) NOT NULL
);

CREATE TABLE photos (
  id serial PRIMARY KEY,
  client_id integer REFERENCES clients (id) NOT NULL
  event_id integer REFERENCES events (id) NOT NULL
  photo_id integer NOT NULL
);
