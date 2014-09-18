DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS musicals;

CREATE TABLE musicals (
  id serial primary key,
  title varchar(100) NOT NULL,
  year integer NOT NULL,
  composer varchar(100) NOT NULL,
  lyricist varchar(100) NOT NULL
);

CREATE TABLE songs (
  id serial primary key,
  title varchar(300) NOT NULL,
  musical_id integer REFERENCES musicals(id)
);

CREATE TABLE characters (
  id serial primary key,
  name varchar(300) NOT NULL
);

CREATE TABLE performances (
  id serial primary key,
  song_id integer references songs(id),
  character_id integer references characters(id)
);

#in cli "psql -d musicals_db -f musical.sql"
