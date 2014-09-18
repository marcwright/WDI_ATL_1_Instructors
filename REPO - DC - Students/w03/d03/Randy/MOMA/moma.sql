

CREATE TABLE artists(
id serial PRIMARY KEY,
name VARCHAR(42) NOT NULL,
nationality VARCHAR(42) NOT NULL
);

CREATE TABLE paintings (
id serial PRIMARY KEY,
title VARCHAR(42) NOT NULL,
artist_id INTEGER references artists(id)
);

-- CREATE TABLE characters (
-- id serial PRIMARY KEY,
-- name = VARCHAR(42) NOT NULL
-- );

-- CREATE TABLE performances (
-- id serial PRIMARY KEY,
-- char_id INTEGER references characters(id),
-- song_id INTEGER references songs(id)
-- );
