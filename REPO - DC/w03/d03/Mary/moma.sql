DROP TABLE IF EXISTS paintings;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists(
  id serial PRIMARY KEY,
  name varchar NOT NULL
);

CREATE TABLE paintings(
  id serial PRIMARY KEY,
  title varchar NOT NULL,
  artist_id integer REFERENCES artists(id)
);
