CREATE TABLE user(
id serial PRIMARY KEY NOT NULL,
name VARCHAR(50) NOT NULL,
username VARCHAR(50) NOT NULL,
password VARCHAR(6..12) NOT NULL,
total_friends INTEGER default '0',
total_photos INTEGER default '0');

CREATE TABLE friendship_user_to_user(
id serial PRIMARY KEY NOT NULL,
user_ref_number INTEGER REFERENCES user(id),
friend_ref_number INTEGER REFERENCES user(id));

CREATE TABLE photo(
id serial PRIMARY KEY NOT NULL,
time_taken VARCHAR(50) NOT NULL,
author_id INTEGER REFERENCES user(id) NOT NULL);

CREATE TABLE photo_to_user(
id serial PRIMARY KEY NOT NULL,
photo_ref_number INTEGER REFERENCES photo(id),
viewable_by_user INTEGER REFERENCES user(id));
