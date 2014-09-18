# Travel Log

CREATE TABLE entries (
id serial PRIMARY KEY,
title varchar(140) NOT NULL,
content text NOT NULL,
city integer REFERENCES cities(id)
);

CREATE TABLE cities (
id serial PRIMARY KEY,
name varchar(140) NOT NULL UNIQUE
);

# Photography App

CREATE TABLE clients (
id serial PRIMARY KEY,
name varchar(50),
username varchar(50) NOT NULL UNIQUE,
password varchar (25) NOT NULL
);

CREATE TABLE events (
id serial PRIMARY KEY,
name varchar(100) NOT NULL,
event_date date,
location varchar(50),
client integer REFERENCES clients(id)
);

#Figure Skating

CREATE TABLE results (
id serial PRIMARY KEY,
skater_name varchar(50) NOT NULL,
score integer NOT NULL,
judge_name varchar(50) NOT NULL
);

#Snapchat

CREATE TABLE users (
id serial PRIMARY KEY,
username varchar(25) NOT NULL UNIQUE,
);

CREATE TABLE friends (
id serial PRIMARY KEY,
username varchar(25) NOT NULL UNIQUE,
friend_of integer REFERENCES users(id),
snapshot integer REFERENCES snapshots(id)
);

CREATE TABLE snapshots (
id serial PRIMARY KEY,
title varchar(25) NOT NULL,
owner integer REFERENCES users(id)
);

#The Bachelor

CREATE TABLE seasons (
id serial PRIMARY KEY,
season_number integer NOT NULL UNIQUE,
bachelor integer REFERENCES bachelors(id)
);

CREATE TABLE episodes (
id serial PRIMARY KEY,
title varchar(50) NOT NULL UNIQUE,
air_date date NOT NULL
season integer REFERENCES seasons(id)
);

CREATE TABLE bachelors (
id serial PRIMARY KEY,
name varchar(50) NOT NULL,
married_to integer REFERENCES women(id),
season integer REFERENCES seasons(id)
);

CREATE TABLE women (
id serial PRIMARY KEY,
name varchar(50) NOT NULL,
episode_eliminated integer REFERENCES episodes(id),
married_to integer REFERENCES bachelors(id),
season integer REFERENCES seasons(id)
);
