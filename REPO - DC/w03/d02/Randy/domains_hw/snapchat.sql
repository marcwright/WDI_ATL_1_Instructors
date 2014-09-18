CREATE TABLE users(
id serial PRIMARY KEY,
user_name VARCHAR(42) NOT NULL,
email VARCHAR(42) NOT NULL,
phone_num VARCHAR(12) NOT NULL,
);

CREATE TABLE friends(
id serial PRIMARY KEY,
user_id REFERENCE users(id) NOT NULL,
user_name VARCHAR(42) NOT NULL,
email VARCHAR(42) NOT NULL,
phone_num VARCHAR(12) NOT NULL,
);

CREATE TABLE snapshots(
id serial PRIMARY KEY,
user_id REFERENCE users(id) NOT NULL,
description TEXT NOT NULL,
size INTEGER NOT NULL,
id_num VARCHAR(12) UNIQUE,
);

CREATE TABLE friends_snapshots(
id serial PRIMARY KEY,
friend_id REFERENCE friends(id) NOT NULL,
snapshot_id REFERENCE snapshots(id) NOT NULL
);
