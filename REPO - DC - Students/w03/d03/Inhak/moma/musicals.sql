CREATE TABLE songs(
  id serial PRIMARY KEY,
  title varchar(100) NOT NULL,
  musical_id integer REFERENCES musicals(id)
);

CREATE TABLE characters(
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

CREATE TABLE performances(
  id serial PRIMARY KEY,
  song_id integer references song(id),
  character_id integer references characters(id)
);
