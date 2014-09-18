# Travel Log
CREATE TABLE entries (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL UNIQUE,
  content varchar(500),
  city integer REFERENCES cities(id),
  log integer REFERENCES logs(id)
  );

CREATE TABLE cities (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE
  );

CREATE TABLE logs (
  id serial PRIMARY KEY,
  log_name varchar(20) NOT NULL UNIQUE
  );

# Photo Management App
CREATE TABLE photos (
  id serial PRIMARY KEY,
  date_time timestamp,
  event integer REFERENCES events(id),
  client integer REFERENCES clients(id),
  photographer integer REFERENCES photographers(id)
  );

CREATE TABLE events (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE,
  event_date date,
  location varchar(20),
  client integer REFERENCES clients(id),
  photographer integer REFERENCES photographers(id)
  );

CREATE TABLE clients (
  id serial PRIMARY KEY,
  name varchar(20),
  username varchar(20) NOT NULL UNIQUE,
  password varchar(20 ) NOT NULL UNIQUE,
  photographer integer REFERENCES photographers(id)
  );

CREATE TABLE photographers (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE
  );

# Figure Skating
CREATE TABLE skaters (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE
  );

CREATE TABLE judges (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE
  );

CREATE TABLE judges_skaters (
  id serial PRIMARY KEY,
  skater integer REFERENCES skaters(id),
  judge integer REFERENCES judges(id),
  score integer NOT NULL
  );

# Snapchat
CREATE TABLE users (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE
  );

CREATE TABLE friends (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE
  friend_of integer REFERENCES users(id)
  snapshot integer REFERENCES snapshots(id)
  );

CREATE TABLE snapshots (
  id serial PRIMARY KEY,
  title varchar(20) NOT NULL UNIQUE
  owner integer REFERENCES users(id)
);

# The Bachelor
CREATE TABLE seasons (
  id serial PRIMARY KEY,
  season_number integer UNIQUE,
  bachelor integer REFERENCES men(id),
  );

CREATE TABLE episodes (
  id serial PRIMARY KEY,
  title varchar(20) NOT NULL UNIQUE,
  air_date date,
  season integer REFERENCES seasons(id)
  );

CREATE TABLE women (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE,
  hometown varchar(20),
  occupation varchar(20),
  season integer REFERENCES season(id),
  episode_eliminated integer REFERENCES episodes(id)
  );

CREATE TABLE men (
  id serial PRIMARY KEY,
  name varchar(20) NOT NULL UNIQUE,
  hometown varchar(20),
  occupation varchar(20),
  season integer REFERENCES season(id),
  );

# Jeopardy



