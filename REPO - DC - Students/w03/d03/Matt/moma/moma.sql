DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS paintings;

CREATE TABLE artists (
  id serial primary key,
  name varchar(300) NOT NULL,
  nationality varchar(100)
);

CREATE TABLE paintings (
  id serial primary key,
  title varchar(300) NOT NULL,
  artist_id integer REFERENCES artists(id)
);
