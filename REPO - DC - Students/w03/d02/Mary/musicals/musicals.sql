DROP TABLE IF EXISTS musicals;
DROP TABLE IF EXISTS songs;

CREATE TABLE musicals(
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  year integer NOT NULL,
  composer varchar(100) NOT NULL,
  lyricis varchar(100) NOT NULL
);

CREATE TABLE songs(
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  musical_id integer REFERENCES musicals(id)
);
