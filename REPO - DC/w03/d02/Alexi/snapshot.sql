CREATE TABLE users (
id serial PRIMARY KEY,
user_name VARCHAR(20) UNIQUE,
email VARCHAR(50) UNIQUE
);

CREATE TABLE pictures (
id serial PRIMARY KEY
title VARCHAR(20),
caption VARCHAR(140)
);

CREATE TABLE friendships (
id serial PRIMARY KEY,
friend1 REFERENCES users (id) NOT NULL,
friend2 REFERENCES users (id) NOT NULL,
);
