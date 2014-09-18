DROP TABLE IF EXISTS musicals;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS performances;

CREATE TABLE musicals (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  year integer NOT NULL,
  composer varchar(100) NOT NULL,
  lyricist varchar(100) NOT NULL
);

CREATE TABLE songs (
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  musicals_id integer REFERENCES musicals (id) NOT NULL
  );

CREATE TABLE characters (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);
-- Characters & Songs relation
CREATE TABLE performances (
  id serial PRIMARY KEY,
  song_id integer REFERENCES songs (id) NOT NULL,
  character_id integer REFERENCES characters (id) NOT NULL
);
