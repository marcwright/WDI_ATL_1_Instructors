DROP TABLE IF EXISTS paintings;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id serial PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE paintings (
  id serial PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  artist_id serial REFERENCES artists (id) NOT NULL,
  description text UNIQUE,
  paint_date integer UNIQUE
);
