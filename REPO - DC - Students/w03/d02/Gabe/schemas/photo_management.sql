CREATE TABLE client(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
username VARCHAR(50) NOT NULL,
password VARCHAR(6..12) NOT NULL,
address VARCHAR(100) NOT NULL,
phone_number INTEGER);

CREATE TABLE event_album(
id serial PRIMARY KEY NOT NULL,
event_name VARCHAR(100),
event_date VARCHAR(50) NOT NULL,
location VARCHAR(100),
client_id INTEGER REFERENCES client(id) NOT NULL);

CREATE TABLE photo(
id serial PRIMARY KEY NOT NULL,
time_taken VARCHAR(50) NOT NULL,
event_album_reference INTEGER REFERENCES event_album(id) NOT NULL);
