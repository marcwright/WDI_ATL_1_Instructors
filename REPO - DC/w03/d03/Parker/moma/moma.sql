DROP TABLE IF EXISTS paintings;

DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id serial primary key,
  name varchar(100) NOT NULL,
  era varchar(100) NOT NULL
);

CREATE TABLE paintings (
  id serial primary key,
  title varchar(100) NOT NULL,
  artists_id integer references artists(id)
);
