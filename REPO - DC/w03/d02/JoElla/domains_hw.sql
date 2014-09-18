#Travel log
CREATE TABLE entries (
  id SERIAL PRIMARY,
  date integer NOT NULL,
  title varchar(20) NOT NULL,
  city integer REFERENCES cities_id
);

CREATE TABLE cities (
  id SERIAL PRIMARY,
  city_name varchar(20) NOT NULL,
  region varchar(20) NOT NULL,
  country varchar(20) NOT NULL
);


#Photo management
CREATE TABLE clients (
  id SERIAL PRIMARY,
  name varchar(20) NOT NULL
);

CREATE TABLE events (
  id SERIAL PRIMARY,
  event_name varchar(20) NOT NULL,
  client integer REFERENCES clients_id
);

CREATE TABLE photos (
  id SERIAL PRIMARY,
  caption varchar(50),
  event integer REFERENCES events_id
);

#Figure skating

CREATE TABLE skaters (
  id SERIAL PRIMARY,
  name varchar(20) NOT NULL
);

CREATE TABLE judgees (
  id SERIAL PRIMARY,
  name varchar(20) NOT NULL
);

CREATE TABLE scores (
  id SERIAL PRIMARY,
  skater integer REFERENCES skaters_id,
  judge integer REFERENCES judges_id,
  score integer NOT NULL
);

#Snapchat

CREATE TABLE users (
  id SERIAL PRIMARY,
  user_name varchar(10) NOT NULL,
  first_name varchar(10) NOT NULL,
  last_name varchar(10) NOT NULL
);

CREATE TABLE pictures (
  id SERIAL PRIMARY,
  caption varchar(100),
  user integer REFERENCES user_id
);

#The Bachelor

CREATE TABLE season (
  id SERIAL PRIMARY,
  season integer NOT NULL
);

CREATE TABLE episode (
  id SERIAL PRIMARY,
  title varchar(20) NOT NULL,
  date integer NOT NULL,
  season integer REFERENCES season_id,
  bachelor integer REFERENCES bachelor_id
);

CREATE TABLE bachelor (
  id SERIAL PRIMARY,
  first_name varchar(10) NOT NULL,
  last_name varchar(10) NOT NULL
);

CREATE TABLE ladies (
  id SERIAL PRIMARY,
  first_name varchar(10) NOT NULL,
  last_name varchar(10) NOT NULL,
  bachelor integer REFERENCES bachelor_id
);
