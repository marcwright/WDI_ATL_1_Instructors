DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS paintings;

CREATE TABLE artists (
  id serial primary key,
  name varchar(100) NOT NULL,
  nationality varchar(100) NOT NULL
);

CREATE TABLE paintings (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  artist integer REFERENCES artists (id)
);
