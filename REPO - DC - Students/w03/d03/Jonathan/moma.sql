DROP TABLE IF EXISTS paintings;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id serial primary key,
  first_name varchar(100) NOT NULL,
  last_name varchar(100) NOT NULL,
  nationality varchar(50) NOT NULL
);

CREATE TABLE paintings (
  id serial primary key,
  title varchar(100) NOT NULL,
  artist_id INTEGER REFERENCES artists (id) NOT NULL,
);
