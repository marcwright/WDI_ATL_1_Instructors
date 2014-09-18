CREATE TABLE events (
id serial PRIMARY KEY,
event_title VARCHAR(50) NOT NULL,
event_type VARCHAR(30) NOT NULL,
event_date date NOT NULL
);

CREATE TABLE clients (
id serial PRIMARY KEY,
name VARCHAR(50) NOT NULL,
user_name VARCHAR(15) UNIQUE,
password VARCHAR(30) NOT NULL
);

CREATE TABLE photos (
  id serial PRIMARY KEY,
  photo_name VARCHAR(20),
  photo_time VARCHAR(10) NOT NULL,
  event_date_id REFERENCES events (id) NOT NULL
);

 CREATE TABLE rel_clients_events (
id serial PRIMARY KEY,
event_title_id REFERENCES events (id) NOT NULL,
user_name_id REFERENCES clients (id) NOT NULL,
);
