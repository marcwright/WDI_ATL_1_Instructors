DROP TABLE IF EXISTS musicals;
DROP TABLE IF EXISTS songs;

CREATE TABLE musicals (
  id serial primary key,
  title varchar(100) NOT NULL,
  year integer NOT NULL,
  composer varchar(100) NOT NULL,
  lyricist varchar(100) NOT NULL
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  musical_id INTEGER REFERENCES musicals(id)
);
